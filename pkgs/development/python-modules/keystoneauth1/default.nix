{ stdenv, buildPythonPackage, fetchPypi
# , pycrypto, testtools, fixtures, betamax, pyyaml, oslo-utils, oslotest, bandit, oslo-config, coverage, testrepository, requests-mock_openstack_ocata, hacking, sphinx, oslosphinx, testresources, mock, reno, os-testr
, fixtures, betamax, iso8601, stevedore, lxml, requests_openstack_ocata, positional, six, pbr, oauthlib
}:

buildPythonPackage rec {
  pname = "keystoneauth1";
  version = "2.18.0";
  name = "${pname}-${version}";

  src = fetchPypi {
    inherit pname version;
    sha256 = "075a9ca7a8877c5885fa2487699015e45260c4e6be119683effe0ad2ab1255d2";
  };

  # infinite recursion
  doCheck = false;
  # buildInputs = [ pycrypto testtools fixtures betamax pyyaml oslo-utils oslotest bandit oslo-config coverage testrepository requests-mock_openstack_ocata hacking sphinx oslosphinx testresources mock reno os-testr ];
  propagatedBuildInputs = [ fixtures iso8601 betamax stevedore lxml requests_openstack_ocata positional six pbr oauthlib ];
  meta = with stdenv.lib; {
    homepage = "http://docs.openstack.org/developer/keystoneauth/";
    license = licenses.asl20;
    description = "Authentication Library for OpenStack Identity";
  };
}
