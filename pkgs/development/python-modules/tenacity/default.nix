{ stdenv, buildPythonPackage, fetchPypi, lib, isPy3k
, pytest
, monotonic, futures, six
}:

buildPythonPackage rec {
  pname = "tenacity";
  version = "4.0.1";
  name = "${pname}-${version}";

  src = fetchPypi {
    inherit pname version;
    sha256 = "f1aff41a2ce733ef9daaac9941323d8f03f4ba08d6b9f60b8936a66c68c208a6";
  };

  # Test files tenacity/tests/test_tenacity.py needs python3
  checkPhase = ''
    py.test ${lib.optionalString (!isPy3k) "tenacity/tests/test_tenacity.py"}
  '';

  buildInputs = [ pytest ];
  propagatedBuildInputs = [ pytest monotonic futures six ];
  meta = with stdenv.lib; {
    homepage = "https://github.com/jd/tenacity";
    license = licenses.asl20;
    description = "Retry code until it succeeeds";
  };
}
