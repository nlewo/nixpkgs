{ stdenv, buildPythonPackage, fetchPypi
, coverage, ddt, fixtures, hacking, mock, os-testr, oslo-serialization, oslosphinx, reno, requests-mock_openstack_ocata, sphinx_openstack_ocata, subunit, testrepository, testtools
, Babel, keystoneauth1, oslo-i18n, oslo-utils, pbr, prettytable, requests_openstack_ocata, simplejson, six
}:

buildPythonPackage rec {
  pname = "python-cinderclient";
  version = "1.11.0";
  name = "${pname}-${version}";

  src = fetchPypi {
    inherit pname version;
    sha256 = "959025508816705f9eb0568ef82e7f13e152ae717af18c3e499506b988335ddc";
  };

  buildInputs = [ coverage ddt fixtures hacking mock os-testr oslo-serialization oslosphinx reno requests-mock_openstack_ocata sphinx_openstack_ocata subunit testrepository testtools ];
  propagatedBuildInputs = [ Babel keystoneauth1 oslo-i18n oslo-utils pbr prettytable requests_openstack_ocata simplejson six ];
  meta = with stdenv.lib; {
    homepage = "http://docs.openstack.org/developer/python-cinderclient";
    license = licenses.asl20;
    description = "OpenStack Block Storage API Client Library";
  };
}
