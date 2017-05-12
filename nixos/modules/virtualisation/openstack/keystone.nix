{ config, lib, pkgs, ... }:

with lib; with import ./common.nix {inherit lib;};

let
  cfg = config.virtualisation.openstack.keystone;
  keystoneConfTpl = pkgs.writeText "keystone.conf" ''
    [DEFAULT]
    admin_token = ${cfg.adminToken.pattern}
    policy_file=${cfg.package}/etc/policy.json

    [database]

    connection = "mysql://${cfg.database.user}:${cfg.database.password.pattern}@${cfg.database.host}/${cfg.database.name}"

    [paste_deploy]
    config_file = ${cfg.package}/etc/keystone-paste.ini

    ${cfg.extraConfig}
  '';
  keystoneConf = "/var/lib/keystone/keystone.conf";

in {
  options.virtualisation.openstack.keystone = {
    package = mkOption {
      type = types.package;
      example = literalExample "pkgs.keystone";
      description = ''
        Keystone package to use.
      '';
    };

    enable = mkOption {
      default = false;
      type = types.bool;
      description = ''
        Enable Keystone, the OpenStack Identity Service
      '';
    };

    extraConfig = mkOption {
      default = "";
      type = types.lines;
      description = ''
        Additional text appended to <filename>keystone.conf</filename>,
        the main Keystone configuration file.
      '';
    };

    adminToken = mkSecretOption {
      name = "adminToken";
      description = ''
        This is the admin token used to boostrap keystone,
        ie. to provision first resources.
      '';
    };

    bootstrap = {
      enable = mkOption {
        default = false;
        type = types.bool;
        description = ''
          Bootstrap the Keystone service by creating the service
          tenant, an admin account and a public endpoint. This options
          provides a ready-to-use admin account. This is only done at
          the first Keystone execution by the systemd post start.

          Note this option is a helper for setting up development or
          testing environments.
        '';
      };

      endpointPublic = mkOption {
        type = types.str;
        default = "http://localhost:5000/v2.0";
        description = ''
          The public identity endpoint. The link <link
          xlink:href="http://docs.openstack.org/liberty/install-guide-rdo/keystone-services.html">
          create keystone endpoint</link> provides more informations
          about that.
        '';
      };

      adminUsername = mkOption {
        type = types.str;
        default = "admin";
        description = ''
          A keystone admin username.
        '';
      };

      adminPassword = mkSecretOption {
        name = "keystoneAdminPassword";
        description = ''
          The keystone admin user's password.
        '';
      };

      adminTenant = mkOption {
        type = types.str;
        default = "admin";
        description = ''
          A keystone admin tenant name.
        '';
      };
    };

    database = {
      host = mkOption {
        type = types.str;
        default = "localhost";
        description = ''
          Host of the database.
        '';
      };

      name = mkOption {
        type = types.str;
        default = "keystone";
        description = ''
          Name of the existing database.
        '';
      };

      user = mkOption {
        type = types.str;
        default = "keystone";
        description = ''
          The database user. The user must exist and has access to
          the specified database.
        '';
      };
      password = mkSecretOption {
        name = "mysqlPassword";
        description = "The database user's password";};
    };
  };

  config = mkIf cfg.enable {
    # Note: when changing the default, make it conditional on
    # ‘system.stateVersion’ to maintain compatibility with existing
    # systems!
    virtualisation.openstack.keystone.package = mkDefault pkgs.keystone;

    users.extraUsers = [{
      name = "keystone";
      group = "keystone";
      uid = config.ids.uids.keystone;
    }];
    users.extraGroups = [{
      name = "keystone";
      gid = config.ids.gids.keystone;
    }];

    systemd.services.keystone-admin = {
        description = "OpenStack Keystone Daemon";
        after = [ "network.target"];
        path = [ cfg.package pkgs.mysql pkgs.curl pkgs.pythonPackages.keystoneclient pkgs.gawk ];
        wantedBy = [ "multi-user.target" ];
        preStart = ''
          mkdir -m 755 -p /var/lib/keystone

          cp ${keystoneConfTpl} ${keystoneConf};
          chown keystone:keystone ${keystoneConf};
          chmod 640 ${keystoneConf}

          ${replaceSecret cfg.database.password keystoneConf}
          ${replaceSecret cfg.adminToken keystoneConf}

          # Initialise the database
          ${cfg.package}/bin/keystone-manage --config-file=${keystoneConf} db_sync
          # Initialize Fernet key repositories
	  mkdir -p /etc/keystone/fernet-keys
	  chown -R keystone:keystone /etc/keystone
          ${cfg.package}/bin/keystone-manage --config-file=${keystoneConf} fernet_setup --keystone-user keystone --keystone-group keystone
	  ${cfg.package}/bin/keystone-manage --config-file=${keystoneConf} credential_setup --keystone-user keystone --keystone-group keystone
	  chown -R keystone:keystone /etc/keystone
	  chmod 700 /etc/keystone/fernet-keys/
	  '' +
	  optionalString cfg.bootstrap.enable ''
	  ${cfg.package}/bin/keystone-manage --config-file=/var/lib/keystone/keystone.conf bootstrap --bootstrap-username ${cfg.bootstrap.adminUsername} \
	                                                                                             --bootstrap-password ${getSecret cfg.bootstrap.adminPassword} \
                                                                                                     --bootstrap-project-name ${cfg.bootstrap.adminTenant} \
												     --bootstrap-admin-url http://localhost:35357/v3/ \
												     --bootstrap-internal-url http://localhost:5000/v3/ \
												     --bootstrap-public-url http://localhost:5000/v3/ \
												     --bootstrap-region-id RegionOne \
        '';
        serviceConfig = {
          PermissionsStartOnly = true; # preStart must be run as root
          TimeoutStartSec = "600"; # 10min for initial db migrations
          User = "keystone";
          Group = "keystone";
          ExecStart = "${cfg.package}/bin/keystone-wsgi-admin --port 35357 -- --config-file=${keystoneConf}";
        };
      };

    systemd.services.keystone-public = {
        description = "OpenStack Keystone Daemon";
        after = [ "network.target" "keystone-admin.service"];
        path = [ cfg.package pkgs.mysql pkgs.curl pkgs.pythonPackages.keystoneclient pkgs.gawk ];
        wantedBy = [ "multi-user.target" ];

        serviceConfig = {
          User = "keystone";
          Group = "keystone";
          ExecStart = "${cfg.package}/bin/keystone-wsgi-public --port 5000 -- --config-file=${keystoneConf}";
        };
      };

  };
}
