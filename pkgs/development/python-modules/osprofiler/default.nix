{ stdenv, buildPythonPackage, fetchPypi
, ceilometerclient, redis, oslosphinx, elasticsearch, hacking, testrepository, testtools, sphinx_openstack_ocata, mock, pymongo, subunit, coverage, bandit, reno, ddt
, webob, oslo-messaging, netaddr, requests_openstack_ocata, oslo-utils, oslo-config, oslo-log, six, oslo-concurrency
}:

buildPythonPackage rec {
  pname = "osprofiler";
  version = "1.5.0";
  name = "${pname}-${version}";

  src = fetchPypi {
    inherit pname version;
    sha256 = "aee63cfd888e6049ea82535ce458ce4844b4ac893dcb18060eda24192505627e";
  };

  buildInputs = [ ceilometerclient redis oslosphinx elasticsearch hacking testrepository testtools sphinx_openstack_ocata mock pymongo subunit coverage bandit reno ddt ];
  propagatedBuildInputs = [ webob oslo-messaging netaddr requests_openstack_ocata oslo-utils oslo-config oslo-log six oslo-concurrency ];
  meta = with stdenv.lib; {
    homepage = "http://docs.openstack.org/developer/osprofiler";
    license = licenses.asl20;
    description = "OpenStack Profiler Library";
  };
}
