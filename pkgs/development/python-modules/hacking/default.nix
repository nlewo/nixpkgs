{ stdenv, buildPythonPackage, fetchPypi
, reno, eventlet, testtools, testscenarios, testrepository
, flake8_2_5_5, mccabe_0_2_1, pbr, pep8_1_5_7, pyflakes_0_8_1, six
 }:

buildPythonPackage rec {
  pname = "hacking";
  version = "0.12.0";
  name = "${pname}-${version}";

  src = fetchPypi {
    inherit pname version;
    sha256 = "15hfyrnig2iq4lghd8x72qc9p5c8nqmcaxxd5synsl096gi16v7g";
  };


  propagatedBuildInputs = [ flake8_2_5_5 pbr pyflakes_0_8_1 six ];
  buildInputs = [ mccabe_0_2_1 pep8_1_5_7 reno eventlet testtools testscenarios testrepository ];
  meta = with stdenv.lib; {
    homepage = "http://docs.openstack.org/developer/hacking/";
    license = licenses.asl20;
    description = "OpenStack Hacking Guideline Enforcement";
  };
}
