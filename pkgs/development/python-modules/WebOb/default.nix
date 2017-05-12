{ stdenv, buildPythonPackage, fetchPypi
, nose
, pytest, sphinx_openstack_ocata, coverage
}:

buildPythonPackage rec {
  pname = "WebOb";
  version = "1.6.2";
  name = "${pname}-${version}";

  src = fetchPypi {
    inherit pname version;
    sha256 = "116yfjhwvf41nywavf36bja7d48vywiyvm9z8ryjyhbjqq7c55p0";
  };

  buildInputs = [ nose ];
  propagatedBuildInputs = [ pytest sphinx_openstack_ocata coverage ];
  meta = with stdenv.lib; {
    homepage = "http://webob.org/";
    license = licenses.mit;
    description = "WSGI request and response object";
  };
}
