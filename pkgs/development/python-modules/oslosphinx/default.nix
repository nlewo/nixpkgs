{ stdenv, buildPythonPackage, fetchPypi
, sphinx_openstack_ocata, reno, hacking
, requests_openstack_ocata, pbr, six
}:

buildPythonPackage rec {
  pname = "oslosphinx";
  version = "4.10.0";
  name = "${pname}-${version}";

  src = fetchPypi {
    inherit pname version;
    sha256 = "d4c2cf8c64309440d0634e2f498edb68d80a30a4b0edac861e0e99b894c7bd26";
  };

  doCheck = false;

  buildInputs = [ sphinx_openstack_ocata reno hacking ];
  propagatedBuildInputs = [ requests_openstack_ocata pbr six ];
  meta = with stdenv.lib; {
    homepage = "http://docs.openstack.org/developer/oslosphinx";
    license = licenses.asl20;
    description = "OpenStack Sphinx Extensions and Theme";
  };
}
