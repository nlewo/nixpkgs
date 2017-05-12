{ stdenv, buildPythonPackage, fetchPypi
, tempest-lib, coverage, testrepository, mock, oslosphinx, testtools, subunit, sphinx_openstack_ocata, fixtures, reno
, six, prettytable, iso8601, requests_openstack_ocata, keystoneauth1, stevedore, oslo-i18n, pbr, oslo-utils, oslo-serialization
}:

buildPythonPackage rec {
  pname = "python-ceilometerclient";
  version = "2.8.1";
  name = "${pname}-${version}";

  src = fetchPypi {
    inherit pname version;
    sha256 = "18a018e1ca654601568d1b0b6284099aa60937f6848603bd38f3efe228979e7d";
  };

  buildInputs = [ tempest-lib coverage testrepository mock oslosphinx testtools subunit sphinx_openstack_ocata fixtures reno ];
  propagatedBuildInputs = [ six prettytable iso8601 requests_openstack_ocata keystoneauth1 stevedore oslo-i18n pbr oslo-utils oslo-serialization ];
  meta = with stdenv.lib; {
    homepage = "http://docs.openstack.org/developer/python-ceilometerclient";
    license = licenses.asl20;
    description = "OpenStack Telemetry API Client Library";
  };
}
