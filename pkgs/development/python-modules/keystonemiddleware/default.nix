{ stdenv, buildPythonPackage, fetchPypi
, testresources, webtest, sphinx_openstack_ocata, testtools, requests-mock_openstack_ocata, stevedore, oslotest, docutils, pycrypto, bandit, os-testr, oslosphinx, coverage, hacking, fixtures, reno, testrepository, memcached, mock
, webob, oslo-log, oslo-serialization, oslo-utils, keystoneauth1, six, oslo-messaging, keystoneclient, oslo-i18n, oslo-context, positional, pycadf, requests_openstack_ocata, pbr, oslo-config
}:

buildPythonPackage rec {
  pname = "keystonemiddleware";
  version = "4.15.0";
  name = "${pname}-${version}";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0c87bfa8e8d81425e7ea9f4ddbb5db32b57ddf2cd215abe67b1cc35fb68e90f1";
  };

  doCheck = false;

  buildInputs = [ testresources webtest sphinx_openstack_ocata testtools requests-mock_openstack_ocata stevedore oslotest docutils pycrypto bandit os-testr oslosphinx coverage hacking fixtures reno testrepository memcached mock ];
  propagatedBuildInputs = [ webob oslo-log oslo-serialization oslo-utils keystoneauth1 six oslo-messaging keystoneclient oslo-i18n oslo-context positional pycadf requests_openstack_ocata pbr oslo-config ];
  meta = with stdenv.lib; {
    homepage = "https://docs.openstack.org/developer/keystonemiddleware/";
    license = licenses.asl20;
    description = "Middleware for OpenStack Identity";
  };
}
