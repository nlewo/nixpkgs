{ stdenv, buildPythonPackage, fetchPypi,
  argparse, pbr, six, netaddr, stevedore, mock, rfc3986, debtcollector, oslo-i18n,
  requests-mock_openstack_ocata, bandit, reno, oslosphinx, oslotest
#  setuptools, coverage
  
 }:

buildPythonPackage rec {
  pname = "oslo.config";
  version = "3.24.0";
  name = "${pname}-${version}";

  src = fetchPypi {
    inherit pname version;
    sha256 = "5cb2b3de074fc8f7e28a5122b4ec434df8079420a8309ada51d20b139aea9f64";
  };

  propagatedBuildInputs = [ argparse pbr six netaddr stevedore rfc3986 debtcollector oslo-i18n];
  buildInputs = [ requests-mock_openstack_ocata mock bandit reno oslosphinx ];

  # TODO: circular import on oslo-i18n
  doCheck = false;

  # propagatedBuildInputs = [
  #     self."debtcollector"
  #     self."netaddr"
  #     self."oslo.i18n"
  #     self."rfc3986"
  #     self."six"
  #     self."stevedore"
  #   ];
  meta = with stdenv.lib; {
    homepage = "http://docs.openstack.org/developer/oslo.config/";
    license = "License :: OSI Approved :: Apache Software License";
    description = "Oslo Configuration API";
  };
}
