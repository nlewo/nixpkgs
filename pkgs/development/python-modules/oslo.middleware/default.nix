{ stdenv, buildPythonPackage, fetchPypi
, coverage, oslotest, oslosphinx, testtools, hacking, sphinx_openstack_ocata, mock, reno, fixtures
, pbr, statsd, oslo-context, debtcollector, six, oslo-config, webob, jinja2, oslo-i18n, stevedore, oslo-utils
}:

buildPythonPackage rec {
  pname = "oslo.middleware";
  version = "3.23.1";
  name = "${pname}-${version}";

  src = fetchPypi {
    inherit pname version;
    sha256 = "fab9a0779ff196020875c7e47e6c36b9d6c9468063645b857e687114e70a8019";
  };

  buildInputs = [ coverage oslotest oslosphinx testtools hacking sphinx_openstack_ocata mock reno fixtures ];
  propagatedBuildInputs = [ pbr statsd oslo-context debtcollector six oslo-config webob jinja2 oslo-i18n stevedore oslo-utils ];
  meta = with stdenv.lib; {
    homepage = "http://docs.openstack.org/developer/oslo.middleware";
    license = licenses.asl20;
    description = "Oslo Middleware library";
  };
}
