{ pkgs, stdenv, fetchurl, python2Packages, xmlsec, which, openssl }:

let 
  python = { mkDerivation = pkgs.pythonPackages.buildPythonPackage; };
  self = import ./requirements_generated.nix { inherit pkgs python; } ;
in
  self."python-openstackclient"
