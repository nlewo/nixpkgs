# Global configuration for mininet
# kernel must have NETNS/VETH/SCHED
{ config, lib, pkgs, ... }:

with lib;

let
  cfg  = config.programs.mininet;

  pyEnv = pkgs.python.withPackages(ps: [ ps.mininet-python ]);
in
{
  options.programs.mininet.enable = mkEnableOption ''
      Whether to enable mininet.
    '';

  config = mkIf cfg.enable {

    virtualisation.vswitch.enable = true;

    environment.systemPackages = with pkgs; [
      iperf
      telnet # mn will stop if no telnet is available
      ethtool iproute socat
    ];

    security.wrappers = {
      mnexec.source = "${pkgs.mininet}/bin/mnexec";
      # I still have to run it with sudo
      # mn.source = "${pyEnv}/bin/mn";
    };
  };
}
