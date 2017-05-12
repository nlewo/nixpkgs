{ stdenv, buildPythonPackage, fetchPypi
, mock, bandit, redis, pyzmq, sphinx_openstack_ocata, oslotest, testscenarios, fixtures, coverage, eventlet, hacking, greenlet, mox3, subunit, testtools, testrepository, reno, oslosphinx # ,pifpaf, pyngus,  
, amqp_1, six, tenacity, webob, kombu_3, futures, stevedore, cachetools, oslo-config, oslo-utils, oslo-context, debtcollector, futurist, pika, oslo-service, oslo-log, pika-pool, oslo-middleware, pbr, oslo-i18n, pyyaml, monotonic, oslo-serialization
}:

buildPythonPackage rec {
  pname = "oslo.messaging";
  version = "5.17.1";
  name = "${pname}-${version}";

  src = fetchPypi {
    inherit pname version;
    sha256 = "fb9b24de06a114189b8d397e553e3dfc5e49c378a55fb14a33a7ec83e48b652d";
  };

  doCheck = false;

  buildInputs = [ mock bandit redis pyzmq sphinx_openstack_ocata oslotest testscenarios fixtures coverage eventlet hacking greenlet mox3 subunit testtools testrepository reno oslosphinx ];
  propagatedBuildInputs = [ amqp_1 six tenacity webob kombu_3 futures stevedore cachetools oslo-config oslo-utils oslo-context debtcollector futurist pika oslo-service oslo-log pika-pool oslo-middleware pbr oslo-i18n pyyaml monotonic oslo-serialization ];
  meta = with stdenv.lib; {
    homepage = "http://docs.openstack.org/developer/oslo.messaging/";
    license = licenses.asl20;
    description = "Oslo Messaging API";
  };
}
