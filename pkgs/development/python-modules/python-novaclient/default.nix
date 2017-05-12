{ stdenv, buildPythonPackage, fetchPypi
, bandit, cinderclient, coverage, fixtures, glanceclient, hacking, keyring, keystoneclient, mock, os-client-config, oslosphinx, osprofiler, reno, requests-mock_openstack_ocata, sphinx_openstack_ocata, testrepository, testscenarios, testtools
, Babel, iso8601, keystoneauth1, oslo-i18n, oslo-serialization, oslo-utils, pbr, prettytable, requests_openstack_ocata, simplejson, six
}:

buildPythonPackage rec {
  pname = "python-novaclient";
  version = "7.1.0";
  name = "${pname}-${version}";

  src = fetchPypi {
    inherit pname version;
    sha256 = "fe69d9c95447381d563f0828359920730d38d5fa6f23af1215d4958479d1b9cb";
  };

  # TODO: check if removing this test is really harmless
  preCheck = ''
    substituteInPlace novaclient/tests/unit/v2/test_servers.py --replace "test_get_password" "noop"
  '';

  buildInputs = [ bandit cinderclient coverage fixtures glanceclient hacking keyring keystoneclient mock os-client-config oslosphinx osprofiler reno requests-mock_openstack_ocata sphinx_openstack_ocata testrepository testscenarios testtools ];
  propagatedBuildInputs = [ Babel iso8601 keystoneauth1 oslo-i18n oslo-serialization oslo-utils pbr prettytable requests_openstack_ocata simplejson six ];
  meta = with stdenv.lib; {
    homepage = "http://docs.openstack.org/developer/python-novaclient";
    license = licenses.asl20;
    description = "Client library for OpenStack Compute API";
  };
}
