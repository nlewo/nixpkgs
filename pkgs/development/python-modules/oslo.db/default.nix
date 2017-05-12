{ stdenv, buildPythonPackage, fetchPypi
, hacking, oslosphinx, subunit, coverage, sqlalchemy, sphinx_openstack_ocata, oslo-utils, os-testr, alembic, sqlalchemy_migrate, eventlet, fixtures, oslotest, stevedore, reno, testtools, testresources, testrepository, psycopg2, mock, six, oslo-context, pymysql, testscenarios, oslo-i18n, oslo-config, debtcollector, pbr
}:

buildPythonPackage rec {
  pname = "oslo.db";
  version = "4.17.0";
  name = "${pname}-${version}";

  src = fetchPypi {
    inherit pname version;
    sha256 = "e25bfea8393bdbecba84cf82910378c34d646e930e9bedd5e8bf7b20a73f3ba7";
  };

  propagatedBuildInputs = [ oslosphinx subunit coverage sqlalchemy sphinx_openstack_ocata oslo-utils os-testr alembic sqlalchemy_migrate eventlet fixtures oslotest stevedore reno testtools testresources testrepository psycopg2 mock six oslo-context pymysql testscenarios oslo-i18n oslo-config debtcollector pbr ];
  meta = with stdenv.lib; {
    homepage = "http://docs.openstack.org/developer/oslo.db";
    license = licenses.asl20;
    description = "Oslo Database library";
  };
}
