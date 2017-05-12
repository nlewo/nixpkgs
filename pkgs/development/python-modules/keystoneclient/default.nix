{ stdenv, buildPythonPackage, fetchPypi
, testrepository, testresources, testtools, bandit, mock, requests-mock_openstack_ocata
, debtcollector, oslo-config, oslo-i18n, oslo-utils, oslo-serialization, pbr, positional, requests_openstack_ocata, six, stevedore, keystoneauth1, osprofiler
}:

buildPythonPackage rec {
  pname = "python-keystoneclient";
  version = "3.10.0";
  name = "${pname}-${version}";

  src = fetchPypi {
    inherit pname version;
    sha256 = "c65fa56791ec02dc942ad08e5c3634b8dca98eda76ee3c2549018b6767e67918";
  };

  doCheck = false;

  buildInputs = [ testrepository testresources testtools bandit mock requests-mock_openstack_ocata ];
  propagatedBuildInputs = [ debtcollector oslo-config oslo-i18n oslo-utils oslo-serialization pbr positional requests_openstack_ocata six stevedore keystoneauth1 osprofiler ];
  #        oslo-serialization  oslo-i18n oslo-utils
  #        Babel argparse prettytable requests_openstack_ocata six iso8601 stevedore
  #        netaddr

	 

  # bandit webob mock pycrypto ];
  
  #     self."debtcollector"
  #     self."keystoneauth1"
  #     self."oslo.config"
  #     self."oslo.i18n"
  #     self."oslo.serialization"
  #     self."oslo.utils"
  #     self."pbr"
  #     self."positional"
  #     self."requests"
  #     self."six"
  #     self."stevedore"
  #   ];
  meta = with stdenv.lib; {
    homepage = "http://docs.openstack.org/developer/python-keystoneclient";
    license = licenses.asl20;
    description = "Client Library for OpenStack Identity";
  };
}
