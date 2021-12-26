{pkgs}:

let
  buildLayer = {
    # A list of store path
    contents,
    # A store path to exclude. This is mainly useful to exclude the
    # configuration file from the container layer.
    exclude ? null,
    # A list of layers containing dependencies: if a store path of the
    # currently built layer already belongs to a dependency layer,
    # this store path is skipped
    dependencyLayers ? []
  }:
  pkgs.runCommand "layer.json" {} ''
    echo ${pkgs.containers-image-nix}/bin/containers-image-nix layer ${pkgs.closureInfo {rootPaths = contents;}}/store-paths
    ${pkgs.containers-image-nix}/bin/containers-image-nix layer \
       ${pkgs.closureInfo {rootPaths = contents;}}/store-paths \
       ${pkgs.lib.concatStringsSep " "  dependencyLayers} \
       ${pkgs.lib.optionalString (exclude != null) "--exclude ${exclude}"} > $out
  '';
  
  buildImage = {
    # An attribute set describing a container configuration
    config,
    dependencyLayers ? []}:
  let
    defaults = {
      os = "linux";
      architecture = "amd64";
    };
    configFile = pkgs.writeText "config.json" (builtins.toJSON (config // defaults));
    configLayer = buildLayer {
      contents = configFile;
      exclude = configFile;
      dependencyLayers = dependencyLayers;
    };
    layerPaths = pkgs.lib.concatStringsSep " "  ([configLayer] ++ dependencyLayers);
  in
  pkgs.runCommand "image.json" {} ''
    echo ${pkgs.containers-image-nix}/bin/containers-image-nix image ${configFile} ${layerPaths}
    ${pkgs.containers-image-nix}/bin/containers-image-nix image ${configFile} ${layerPaths} > $out
  '';

  application = pkgs.writeScript "conversation" ''
    ${pkgs.hello}/bin/hello 
    echo "Haaaaa... I'm dying!!!"
  '';
  
in {
  inherit buildImage buildLayer;
  example = {
    image = buildImage {
      config = {
        entrypoint = ["${pkgs.bash}/bin/bash" application];
      };
      dependencyLayers = [
        (buildLayer { contents = [pkgs.bash pkgs.hello]; })
      ];
    };
  };
}
