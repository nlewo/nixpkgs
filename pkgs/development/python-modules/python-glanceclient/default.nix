{ stdenv, buildPythonPackage, fetchPypi
, coverage, fixtures, hacking, mock, ordereddict, os-client-config, oslosphinx, reno, requests-mock_openstack_ocata, sphinx_openstack_ocata, testrepository, testscenarios, testtools
, Babel, keystoneauth1, oslo-i18n, oslo-utils, pbr, prettytable, requests_openstack_ocata, six, warlock, wrapt
}:

buildPythonPackage rec {
  pname = "python-glanceclient";
  version = "2.6.0";
  name = "${pname}-${version}";

  src = fetchPypi {
    inherit pname version;
    sha256 = "59ce6ec4cb17e6cb5b94e12d4563a1b6fe2f6dd11c8e1d4e42e45073c76bcc0b";
  };
  
  # TODO
  doCheck = false;

  buildInputs = [ coverage fixtures hacking mock ordereddict os-client-config oslosphinx reno requests-mock_openstack_ocata sphinx_openstack_ocata testrepository testscenarios testtools ];
  propagatedBuildInputs = [ Babel keystoneauth1 oslo-i18n oslo-utils pbr prettytable requests_openstack_ocata six warlock wrapt ];
  meta = with stdenv.lib; {
    homepage = "http://docs.openstack.org/developer/python-glanceclient";
    license = licenses.asl20;
    description = "OpenStack Image API Client Library";
  };
}
