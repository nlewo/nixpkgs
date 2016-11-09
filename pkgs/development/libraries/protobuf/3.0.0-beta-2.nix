{ callPackage, fetchFromGitHub, ... } @ args:

callPackage ./generic-v3.nix (args // rec {
  version = "3.0.0-beta-2";
  # make sure you test also -A pythonPackages.protobuf
  src = fetchFromGitHub {
    owner = "google";
    repo = "protobuf";
    rev = "v${version}";
    sha256 = "0cbr1glgma5vakabsjwcs41pcnn8yphhn037l0zd121zb9gdaqc1";
  };
})
