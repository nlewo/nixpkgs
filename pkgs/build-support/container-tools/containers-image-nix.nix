{buildGoModule}:

buildGoModule rec {
  pname = "container-images-nix";
  version = "0.0.1";

  src = /home/lewo/repos/containers-image-nix;

  vendorSha256 = null;
  runVend = true;
}
