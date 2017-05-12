{ stdenv, buildPythonPackage, fetchPypi
#, oslosphinx, reno, sphinx, requests-mock, python-neutronclient, mock, python-senlinclient, tempest, python-heatclient, stevedore, fixtures, os-client-config, python-troveclient, python-saharaclient, python-mistralclient, os-testr, python-designateclient, testtools, hacking, osprofiler, oslotest, python-zaqarclient, python-searchlightclient, python-barbicanclient, wrapt, aodhclient, python-ironicclient, python-muranoclient, requests, python-ironic-inspector-client, testrepository, python-congressclient, bandit, coverage
, cinderclient, cliff, keystoneclient, Babel, openstacksdk, osc-lib, pbr, oslo-i18n, novaclient, six, glanceclient, oslo-utils, keystoneauth1
}:

buildPythonPackage rec {
  pname = "python-openstackclient";
  version = "3.8.1";
  name = "${pname}-${version}";

  src = fetchPypi {
    inherit pname version;
    sha256 = "a64577380f5a5d1df1b0ca3a5a70b40245ba4744e1f655a58fd70aad2f6a796d";
  };

  # Too much build input...
  doCheck = false;
  # buildInputs = [ oslosphinx reno sphinx requests-mock python-neutronclient mock python-senlinclient tempest python-heatclient stevedore fixtures os-client-config python-troveclient python-saharaclient python-mistralclient os-testr python-designateclient testtools hacking osprofiler oslotest python-zaqarclient python-searchlightclient python-barbicanclient wrapt aodhclient python-ironicclient python-muranoclient requests python-ironic-inspector-client testrepository python-congressclient bandit coverage ];
  propagatedBuildInputs = [ cinderclient cliff keystoneclient Babel openstacksdk osc-lib pbr oslo-i18n novaclient six glanceclient oslo-utils keystoneauth1 ];
  meta = with stdenv.lib; {
    homepage = "http://docs.openstack.org/developer/python-openstackclient";
    license = licenses.asl20;
    description = "OpenStack Command-line Client";
  };
}
