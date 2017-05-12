{ stdenv, buildPythonPackage, fetchPypi
, mock, oslosphinx, sphinx_openstack_ocata, nose, coverage
, prettytable, pyparsing, unicodecsv, pbr, stevedore, cmd2, pyyaml, six
}:

buildPythonPackage rec {
  pname = "cliff";
  version = "2.4.0";
  name = "${pname}-${version}";

  src = fetchPypi {
    inherit pname version;
    sha256 = "cc9175e3c2a42bc06343290a1218bc6b70f36883520b2948f743c5f9ae917675";
  };

  buildInputs = [ mock oslosphinx sphinx_openstack_ocata nose coverage ];
  propagatedBuildInputs = [ prettytable pyparsing unicodecsv pbr stevedore cmd2 pyyaml six ];
  meta = with stdenv.lib; {
    homepage = "http://docs.openstack.org/developer/cliff";
    license = licenses.asl20;
    description = "Command Line Interface Formulation Framework";
  };
}
