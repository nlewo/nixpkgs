{ lib, stdenv, buildPythonPackage, fetchPypi }:

buildPythonPackage rec {
  pname = "monotonic";
  version = "1.3";
  name = "${pname}-${version}";

  src = fetchPypi {
    inherit pname version;
    sha256 = "2b469e2d7dd403f7f7f79227fe5ad551ee1e76f8bb300ae935209884b93c7c1b";
  };

  __propagatedImpureHostDeps = stdenv.lib.optional stdenv.isDarwin "/usr/lib/libc.dylib";
  patchPhase = lib.optionalString stdenv.isLinux ''
    substituteInPlace monotonic.py --replace \
      "ctypes.util.find_library('c')" "'${stdenv.glibc.out}/lib/libc.so.6'"
  '';

  meta = with stdenv.lib; {
    homepage = "https://github.com/atdt/monotonic";
    license = licenses.asl20;
    description = "An implementation of time.monotonic() for Python 2 & < 3.3";
  };
}
