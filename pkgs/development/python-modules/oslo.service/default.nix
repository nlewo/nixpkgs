{ stdenv, buildPythonPackage, fetchPypi
, sphinx_openstack_ocata, fixtures, mock, oslotest, bandit, oslosphinx, reno, hacking, coverage
, routes, oslo-concurrency, eventlet, webob, PasteDeploy, six, oslo-config, oslo-i18n, paste, oslo-log, greenlet, oslo-utils, monotonic
}:

buildPythonPackage rec {
  pname = "oslo.service";
  version = "1.19.0";
  name = "${pname}-${version}";

  src = fetchPypi {
    inherit pname version;
    sha256 = "4c4e0198b6d87b6566f48c8e89cbe87386d4b44ba03159f28655f911a65dbff8";
  };

  # TODO
  doCheck = false;
  
  buildInputs = [ sphinx_openstack_ocata fixtures mock oslotest bandit oslosphinx reno hacking coverage ];
  propagatedBuildInputs = [ routes oslo-concurrency eventlet webob PasteDeploy six oslo-config oslo-i18n paste oslo-log greenlet oslo-utils monotonic ];
  meta = with stdenv.lib; {
    homepage = "http://docs.openstack.org/developer/oslo.service";
    license = licenses.asl20;
    description = "oslo.service library";
  };
}
