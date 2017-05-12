{ stdenv, buildPythonPackage, fetchPypi
, oslosphinx, httpretty, oslotest, requests-mock_openstack_ocata
, requests_openstack_ocata, oslo-config, oslo-i18n, oslo-serialization, oslo-utils, six
}:

buildPythonPackage rec {
  pname = "oslo.policy";
  version = "1.22.0";
  name = "${pname}-${version}";

  src = fetchPypi {
    inherit pname version;
    sha256 = "832630f037bfb2b04f86cbcc95cd0121a8bae38ddd2a0bd834f944b9f7612280";
  };

  propagatedBuildInputs = [ requests_openstack_ocata oslo-config oslo-i18n oslo-serialization oslo-utils six ];
  buildInputs = [ oslosphinx httpretty oslotest requests-mock_openstack_ocata];

  meta = with stdenv.lib; {
    homepage = "http://docs.openstack.org/developer/oslo.policy/";
    license = licenses.asl20;
    description = "Oslo Policy library";
  };
}
