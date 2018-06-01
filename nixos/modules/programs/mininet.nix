# Global configuration for mininet
# kernel must have NETNS/VETH/SCHED
{ config, lib, pkgs, ... }:

with lib;

let
  cfg  = config.programs.mininet;

  # pyEnv = pkgs.python.withPackages(ps: [ ps.mininet-python ]);

  generatedPath = with pkgs; makeSearchPath "bin"  [
    # mn will stop if no telnet is available
    # telnet
    iperf ethtool iproute socat
  ];

  mnexecWrapped = pkgs.runCommand "mnexec-wrapper"
    { buildInputs = [ pkgs.makeWrapper ]; }
    ''
      # This wrapper prevents from polluting PATH
      makeWrapper ${pkgs.mininet}/bin/mnexec \
        $out/bin/mnexec \
        --prefix PATH : "${generatedPath}"
    '';
in
{
  options.programs.mininet.enable = mkEnableOption ''
    Whether to enable mininet.
  '';

  config = mkIf cfg.enable {

    virtualisation.vswitch.enable = true;

    security.wrappers = {
      mnexec.source = mnexecWrapped + "/bin/mnexec";
    };
  };
}
