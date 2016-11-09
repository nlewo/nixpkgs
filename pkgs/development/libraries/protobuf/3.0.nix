{ callPackage, fetchFromGitHub, ... } @ args:

callPackage ./generic-v3.nix (args // rec {
  version = "3.0.0";
  # make sure you test also -A pythonPackages.protobuf
  src = fetchFromGitHub {
    owner = "google";
    repo = "protobuf";
    rev = "v${version}";
    sha256 = "05qkcl96lkdama848m7q3nzzzdckjc158iiyvgmln0zi232xx7g7";
  };
})
