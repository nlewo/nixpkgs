{ stdenv, buildPythonPackage, fetchPypi
# , coverage, testscenarios, testtools, reno, sphinx, hacking, fixtures, oslosphinx, testrepository, oslotest, python-subunit
, six, funcsigs, pbr, wrapt
}:

buildPythonPackage rec {
  pname = "debtcollector";
  version = "1.11.0";
  name = "${pname}-${version}";

  src = fetchPypi {
    inherit pname version;
    sha256 = "733afa881c844a40ef4623ab73ce1862e505bc4655635da3a91d8f3482677785";
  };

  # Break cycle
  # buildInputs = [ coverage testscenarios testtools reno sphinx hacking fixtures oslosphinx testrepository oslotest python-subunit ];
  doCheck = false;
  propagatedBuildInputs = [ six funcsigs pbr wrapt ];
  meta = with stdenv.lib; {
    homepage = "http://docs.openstack.org/developer/debtcollector";
    license = licenses.asl20;
    description = "A collection of Python deprecation patterns and strategies that help you collect your technical debt in a non-destructive manner.";
  };
}
