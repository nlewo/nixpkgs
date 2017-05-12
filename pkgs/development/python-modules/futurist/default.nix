{ stdenv, buildPythonPackage, fetchPypi
, testrepository, subunit, testscenarios, oslosphinx, eventlet, reno, testtools, oslotest, sphinx_openstack_ocata, coverage, hacking
, futures, contextlib2, prettytable, monotonic, pbr, six
}:

buildPythonPackage rec {
  pname = "futurist";
  version = "0.21.0";
  name = "${pname}-${version}";

  src = fetchPypi {
    inherit pname version;
    sha256 = "086dd646c067d4ef6dc9c04000828acfbdc00842bd37c64825b596a6976509b4";
  };

  buildInputs = [ testrepository subunit testscenarios oslosphinx eventlet reno testtools oslotest sphinx_openstack_ocata coverage hacking ];
  propagatedBuildInputs = [ futures contextlib2 prettytable monotonic pbr six ];
  meta = with stdenv.lib; {
    homepage = "http://docs.openstack.org/developer/futurist";
    license = licenses.asl20;
    description = "Useful additions to futures, from the future.";
  };
}
