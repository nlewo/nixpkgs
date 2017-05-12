{ stdenv, buildPythonPackage, fetchPypi
, sphinx_openstack_ocata, oslosphinx, reno, hacking, mock, oslotest
, oslo-config, memcached, oslo-i18n, oslo-utils, dogpile_cache, oslo-log, six, pymongo
}:

buildPythonPackage rec {
  pname = "oslo.cache";
  version = "1.20.0";
  name = "${pname}-${version}";

  src = fetchPypi {
    inherit pname version;
    sha256 = "b030f1dcd0d5d7e2bc856a9807b93616a85d7d7666c00ebfb7104b697b101a75";
  };

  buildInputs = [ sphinx_openstack_ocata oslosphinx reno hacking mock oslotest ];
  propagatedBuildInputs = [ oslo-config memcached oslo-i18n oslo-utils dogpile_cache oslo-log six pymongo ];
  meta = with stdenv.lib; {
    homepage = "http://docs.openstack.org/developer/oslo.cache";
    license = licenses.asl20;
    description = "Cache storage for OpenStack projects.";
  };
}
