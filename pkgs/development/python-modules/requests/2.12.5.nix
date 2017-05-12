{ stdenv, buildPythonPackage, fetchPypi, pytest }:

buildPythonPackage rec {
  pname = "requests";
  version = "2.12.5";
  name = "${pname}-${version}";

  src = fetchPypi {
    inherit pname version;
    sha256 = "d902a54f08d086a7cc6e58c20e2bb225b1ae82c19c35e5925269ee94fb9fce00";
  };

  nativeBuildInputs = [ pytest ];
  # sadly, tests require networking
  doCheck = false;

  meta = {
    description = "An Apache2 licensed HTTP library, written in Python, for human beings";
    homepage = http://docs.python-requests.org/en/latest/;
    license = stdenv.lib.licenses.asl20;
  };
}
