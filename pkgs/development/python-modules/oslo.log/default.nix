{ stdenv, buildPythonPackage, fetchPypi
, oslosphinx, testscenarios, hacking, oslotest, bandit, reno, subunit, coverage, testrepository, testtools, sphinx_openstack_ocata, mock
, six, pyinotify, oslo-serialization, monotonic, dateutil, oslo-config, oslo-context, oslo-i18n, fixtures, debtcollector, oslo-utils, pbr
}:

buildPythonPackage rec {
  pname = "oslo.log";
  version = "3.20.1";
  name = "${pname}-${version}";

  src = fetchPypi {
    inherit pname version;
    sha256 = "7d2bf72548f7f9bc94649b49fda642e057b35fd00790080c4e04b941e20aff2d";
  };

  buildInputs = [ oslosphinx testscenarios hacking oslotest bandit reno subunit coverage testrepository testtools sphinx_openstack_ocata mock ];
  propagatedBuildInputs = [ six pyinotify oslo-serialization monotonic dateutil oslo-config oslo-context oslo-i18n fixtures debtcollector oslo-utils pbr ];
  meta = with stdenv.lib; {
    homepage = "http://docs.openstack.org/developer/oslo.log/";
    license = licenses.asl20;
    description = "oslo.log library";
  };
}
