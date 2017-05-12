{ stdenv, buildPythonPackage, fetchPypi
# , oslosphinx, reno, sphinx, hacking, oslo-config, mock, coverage, testscenarios, oslotest
, six, pbr, Babel
}:

buildPythonPackage rec {
  pname = "oslo.i18n";
  version = "3.12.0";
  name = "${pname}-${version}";

  src = fetchPypi {
    inherit pname version;
    sha256 = "6add28cbbe8254838f7f131de0cf0f3761786d57e5fe5716a488260b725f58d3";
  };

  # buildInputs = [ oslosphinx reno sphinx hacking oslo-config mock coverage testscenarios oslotest ];
  # Break cycle
  doCheck = false;
  propagatedBuildInputs = [ six pbr Babel ];
  meta = with stdenv.lib; {
    homepage = "http://docs.openstack.org/developer/oslo.i18n";
    license = licenses.asl20;
    description = "Oslo i18n library";
  };
}
