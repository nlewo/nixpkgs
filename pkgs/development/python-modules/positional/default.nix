{ stdenv, buildPythonPackage, fetchPypi,
  testtools, testresources, testrepository, sphinx_openstack_ocata,
  pbr, wrapt }:

buildPythonPackage rec {
  pname = "positional";
  version = "1.1.1";
  name = "${pname}-${version}";

  src = fetchPypi {
    inherit pname version;
    sha256 = "ef845fa46ee5a11564750aaa09dd7db059aaf39c44c901b37181e5ffa67034b0";
  };

  buildInputs = [ testtools testresources testrepository sphinx_openstack_ocata ];
  propagatedBuildInputs = [ pbr wrapt ];

  meta = with stdenv.lib; {
    homepage = "https://github.com/morganfainberg/positional";
    license = licenses.asl20;
    description = "Library to enforce positional or key-word arguments";
  };
}
