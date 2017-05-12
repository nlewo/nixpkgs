{ stdenv, buildPythonPackage, fetchPypi, pbr }:

buildPythonPackage rec {
  pname = "requestsexceptions";
  version = "1.2.0";
  name = "${pname}-${version}";

  src = fetchPypi {
    inherit pname version;
    sha256 = "8b762ba6ec5f4f5af50bdd3ab07184a0e63803d70e8b1bbbd429a8f5216fe13d";
  };

  propagatedBuildInputs = [ pbr ];
  meta = with stdenv.lib; {
    homepage = "http://www.openstack.org/";
    license = licenses.asl20;
    description = "Import exceptions from potentially bundled packages in requests.";
  };
}
