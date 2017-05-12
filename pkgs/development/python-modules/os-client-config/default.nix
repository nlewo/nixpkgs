{ stdenv, buildPythonPackage, fetchPypi, python,
  pbr, testtools, testscenarios, testrepository, fixtures,
  appdirs, pyyaml, keystoneauth1, requestsexceptions
 }:

buildPythonPackage rec {
  pname = "os-client-config";
  version = "1.26.0";
  name = "${pname}-${version}";

  src = fetchPypi {
    inherit pname version;
    sha256 = "77cb506da9fa5e5dc53b1b8b5dca7c5d7816dea91783518e31bbdd98aa87ece9";
  };

  # buildInputs = [ pbr testtools testscenarios testrepository fixtures ];
  propagatedBuildInputs = [ appdirs pyyaml keystoneauth1 requestsexceptions ];

  doCheck = false;
  patchPhase = ''
    sed -i 's@python@${python.interpreter}@' .testr.conf
  '';
  # TODO: circular import on oslotest
  preCheck = ''
    rm os_client_config/tests/{test_config,test_cloud_config,test_environ}.py
  '';

  # propagatedBuildInputs = [
  #     self."PyYAML"
  #     self."appdirs"
  #     self."keystoneauth1"
  #     self."requestsexceptions"
  #   ];
  meta = with stdenv.lib; {
    homepage = "http://docs.openstack.org/developer/os-client-config/";
    license = "License :: OSI Approved :: Apache Software License";
    description = "OpenStack Client Configuation Library";
  };
}
