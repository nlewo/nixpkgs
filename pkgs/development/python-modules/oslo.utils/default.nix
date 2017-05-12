{ stdenv, buildPythonPackage, fetchPypi
, oslotest, testscenarios, oslo-config, bandit, testrepository, reno, mock, sphinx_openstack_ocata, subunit, oslosphinx, hacking, coverage, testtools, fixtures
, iso8601, netaddr, oslo-i18n, pytz, debtcollector, monotonic, netifaces, pyparsing, six, funcsigs, pbr
}:

buildPythonPackage rec {
  pname = "oslo.utils";
  version = "3.22.0";
  name = "${pname}-${version}";

  src = fetchPypi {
    inherit pname version;
    sha256 = "aa72be266fee787541c02baa9ac341ec4b1b01b0d5a097db459aee05b27b12fb";
  };

  buildInputs = [ oslotest testscenarios oslo-config bandit testrepository reno mock sphinx_openstack_ocata subunit oslosphinx hacking coverage testtools fixtures ];
  propagatedBuildInputs = [ iso8601 netaddr oslo-i18n pytz debtcollector monotonic netifaces pyparsing six funcsigs pbr ];
  meta = with stdenv.lib; {
    homepage = "http://docs.openstack.org/developer/oslo.utils/";
    license = licenses.asl20;
    description = "Oslo Utility library";
  };
}
