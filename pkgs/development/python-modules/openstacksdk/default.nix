{ stdenv, buildPythonPackage, fetchPypi
, sphinx_openstack_ocata, subunit, hacking, os-testr, requests_openstack_ocata, requests-mock_openstack_ocata, fixtures, mock, coverage, testrepository, testtools, testscenarios
, six, pbr, os-client-config, keystoneauth1, stevedore
}:

buildPythonPackage rec {
  pname = "openstacksdk";
  version = "0.9.13";
  name = "${pname}-${version}";

  src = fetchPypi {
    inherit pname version;
    sha256 = "7fee2023e600f68eb3d33c7e03d2e54a3e36cc0e74c212fcc3c1a0b36a7f1041";
  };

  buildInputs = [ sphinx_openstack_ocata subunit hacking os-testr requests_openstack_ocata requests-mock_openstack_ocata fixtures mock coverage testrepository testtools testscenarios ];
  propagatedBuildInputs = [ six pbr os-client-config keystoneauth1 stevedore ];
  meta = with stdenv.lib; {
    homepage = "http://developer.openstack.org/sdks/python/openstacksdk/";
    license = licenses.asl20;
    description = "An SDK for building applications to work with OpenStack";
  };
}
