{ stdenv, buildPythonPackage, fetchPypi
, fixtures, oslotest, oslosphinx, sphinx_openstack_ocata, hacking, coverage, reno
, positional, pbr, debtcollector
}:

buildPythonPackage rec {
  pname = "oslo.context";
  version = "2.12.1";
  name = "${pname}-${version}";

  src = fetchPypi {
    inherit pname version;
    sha256 = "e257c5962928c564ad323a436703733662b39e45d4892d5aff3f290e89e95b94";
  };

  buildInputs = [ fixtures oslotest oslosphinx sphinx_openstack_ocata hacking coverage reno ];
  propagatedBuildInputs = [ positional pbr debtcollector ];
  meta = with stdenv.lib; {
    homepage = "http://docs.openstack.org/developer/oslo.context";
    license = licenses.asl20;
    description = "Oslo Context library";
  };
}
