{ callPackage, fetchFromGitHub, ... } @ args:

callPackage ./generic-v3.nix (args // rec {
  version = "3.1.0";
  # make sure you test also -A pythonPackages.protobuf
  src = fetchFromGitHub {
    owner = "google";
    repo = "protobuf";
    rev = "v${version}";
    sha256 = "0qlvpsmqgh9nw0k4zrxlxf75pafi3p0ahz99v6761b903y8qyv4i";
  };
})
