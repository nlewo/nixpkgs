{ lib
, stdenv
, buildGoModule
, fetchFromGitHub
, gpgme
, lvm2
, btrfs-progs
, pkg-config
, go-md2man
, installShellFiles
, makeWrapper
, fuse-overlayfs
, fetchurl
}:

buildGoModule rec {
  pname = "skopeo";
  version = "1.5.2";

  src = fetchFromGitHub {
    rev = "v${version}";
    owner = "containers";
    repo = "skopeo";
    sha256 = "sha256-KleTvRQwQFr4rrRXFW2z4N7DXIT920O2gig6wmOFIKs=";
  };

  outputs = [ "out" "man" ];

  vendorSha256 = null;

  doCheck = false;

  nativeBuildInputs = [ pkg-config go-md2man installShellFiles makeWrapper ];

  buildInputs = [ gpgme ]
  ++ lib.optionals stdenv.isLinux [ lvm2 btrfs-progs ];

  buildPhase = let
    patch = fetchurl {
        url = "https://github.com/nlewo/image/commit/08c939335ec8c9a819de6ddddaabe6831f61935c.patch";
        sha256 = "sha256-g+cMdZx2/ZlCA3qOd8p9PZJMeprPSRohakYrHLfLpv8=";
    };
    containers-image-nix = fetchFromGitHub {
      owner = "nlewo";
      repo = "containers-image-nix";
      rev = "48ba04122df97bc2ea75862772151c1bd70c0e58";
      sha256 = "sha256-tGJ4A8mETQwyYPiAtim6fee1C2NsgW7BTGqrLsiF4MA=";
    };
  in ''
    mkdir -p vendor/github.com/nlewo/containers-image-nix/
    cp -r ${containers-image-nix}/* vendor/github.com/nlewo/containers-image-nix/
    cat go.mod | grep github.com | grep container
    cd vendor/github.com/containers/image/v5
    echo
    echo
    mkdir nix/
    touch nix/transport.go
    ls -l
    patch -p1 < ${patch}
    echo
    echo
    cd -
    runHook preBuild
    patchShebangs .
    make bin/skopeo docs
    runHook postBuild

  '';

  installPhase = ''
    runHook preInstall
    install -Dm755 bin/skopeo -t $out/bin
    installManPage docs/*.[1-9]
    installShellCompletion --bash completions/bash/skopeo
  '' + lib.optionalString stdenv.isLinux ''
    wrapProgram $out/bin/skopeo \
      --prefix PATH : ${lib.makeBinPath [ fuse-overlayfs ]}
  '' + ''
    runHook postInstall
  '';

  meta = with lib; {
    description = "A command line utility for various operations on container images and image repositories";
    homepage = "https://github.com/containers/skopeo";
    maintainers = with maintainers; [ lewo ] ++ teams.podman.members;
    license = licenses.asl20;
  };
}
