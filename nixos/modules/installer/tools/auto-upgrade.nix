{ config, lib, pkgs, ... }:

with lib;

let cfg = config.system.autoUpgrade; in

{

  options = {

    system.autoUpgrade = {

      enable = mkOption {
        type = types.bool;
        default = false;
        description = ''
          Whether to periodically upgrade NixOS to the latest
          version. If enabled, a systemd timer will run
          <literal>nixos-rebuild switch --upgrade</literal> once a
          day.
        '';
      };

      channel = mkOption {
        type = types.nullOr types.str;
        default = null;
        example = https://nixos.org/channels/nixos-14.12-small;
        description = ''
          The URI of the NixOS channel to use for automatic
          upgrades. By default, this is the channel set using
          <command>nix-channel</command> (run <literal>nix-channel
          --list</literal> to see the current value).
        '';
      };

      preRebuild = mkOption {
        type = types.lines;
        default = "";
        description = ''
	  Bash script lines executed before the execution of
	  nixos-rebuild. If it fails, nixos-rebuild is not
	  executed. It is possible to add extra packages to the
	  systemd unit file with the option
	  <option>extraPath</option>.
        '';
      };

      extraPath = mkOption {
        type = types.listOf types.package;
        example = [ literalExample "pkgs.git" ];
	default = [];
        description = ''
	  A list of packages added to the systemd path. This is only
	  useful in conjonction with option
	  <option>preRebuild</option>.
        '';
      };

      flags = mkOption {
        type = types.listOf types.str;
        default = [];
        example = [ "-I" "stuff=/home/alice/nixos-stuff" "--option" "extra-binary-caches" "http://my-cache.example.org/" ];
        description = ''
          Any additional flags passed to <command>nixos-rebuild</command>.
        '';
      };

      dates = mkOption {
        default = "04:40";
        type = types.str;
        description = ''
          Specification (in the format described by
          <citerefentry><refentrytitle>systemd.time</refentrytitle>
          <manvolnum>5</manvolnum></citerefentry>) of the time at
          which the update will occur.
        '';
      };

    };

  };

  config = {

    system.autoUpgrade.flags =
      [ "--no-build-output" ]
      ++ (if cfg.channel == null
          then [ "--upgrade" ]
          else [ "-I" "nixpkgs=${cfg.channel}/nixexprs.tar.xz" ]);

    systemd.services.nixos-upgrade = {
      description = "NixOS Upgrade";

      restartIfChanged = false;
      unitConfig.X-StopOnRemoval = false;

      serviceConfig.Type = "oneshot";

      environment = config.nix.envVars //
        { inherit (config.environment.sessionVariables) NIX_PATH;
          HOME = "/root";
        };

      path = [ pkgs.gnutar pkgs.xz.bin config.nix.package.out ] ++ cfg.extraPath;

      script = ''
        set -eux
        ${cfg.preRebuild}
        ${config.system.build.nixos-rebuild}/bin/nixos-rebuild switch ${toString cfg.flags}
      '';

      startAt = optional cfg.enable cfg.dates;
    };

  };

}
