{ stdenv, buildPythonPackage, fetchPypi
, eventlet, coverage, fixtures, oslotest, sphinx_openstack_ocata, hacking, reno, futures, oslosphinx
, oslo-i18n, enum34, six, oslo-utils, oslo-config, fasteners, pbr
}:

buildPythonPackage rec {
  pname = "oslo.concurrency";
  version = "3.18.0";
  name = "${pname}-${version}";

  src = fetchPypi {
    inherit pname version;
    sha256 = "49d56f2250e167ee03e3a4255d7b6086f93badd2a826e36d60324b91798c3980";
  };

  doCheck = false;

  buildInputs = [ eventlet coverage fixtures oslotest sphinx_openstack_ocata hacking reno futures oslosphinx ];
  propagatedBuildInputs = [ oslo-i18n enum34 six oslo-utils oslo-config fasteners pbr ];
  meta = with stdenv.lib; {
    homepage = "http://docs.openstack.org/developer/oslo.concurrency";
    license = licenses.asl20;
    description = "Oslo Concurrency library";
  };
}
