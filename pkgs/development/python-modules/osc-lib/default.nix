{ stdenv, buildPythonPackage, fetchPypi
, hacking, testrepository, coverage, oslotest, mock, oslosphinx, reno, requests-mock_openstack_ocata, testtools, os-testr, osprofiler, bandit, sphinx_openstack_ocata, fixtures
, oslo-i18n, oslo-utils, six, keystoneauth1, Babel, simplejson, pbr, os-client-config, stevedore, cliff
}:

buildPythonPackage rec {
  pname = "osc-lib";
  version = "1.3.0";
  name = "${pname}-${version}";

  src = fetchPypi {
    inherit pname version;
    sha256 = "32bf892ba828241f93ae0ef5c94d6b92ac3deb9f061dd4ffb61e05120b4ff365";
  };

  patchPhase = ''
    sed -i "s|/tmp/test_log_file|$TMPDIR/test_log_file|" osc_lib/tests/test_shell.py
  '';

  buildInputs = [ hacking testrepository coverage oslotest mock oslosphinx reno requests-mock_openstack_ocata testtools os-testr osprofiler bandit sphinx_openstack_ocata fixtures ];
  propagatedBuildInputs = [ oslo-i18n oslo-utils six keystoneauth1 Babel simplejson pbr os-client-config stevedore cliff ];
  meta = with stdenv.lib; {
    homepage = "http://docs.openstack.org/developer/osc-lib";
    license = licenses.asl20;
    description = "OpenStackClient Library";
  };
}
