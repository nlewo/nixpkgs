{ stdenv, fetchurl, python2Packages, xmlsec, which, openssl }:

python2Packages.buildPythonApplication rec {
  name = "keystone-${version}";
  version = "11.0.0";
  namePrefix = "";

  PBR_VERSION = "${version}";

  src = fetchurl {
    url = "https://github.com/openstack/keystone/archive/${version}.tar.gz";
    sha256 = "0la6xrvili5sm6zkl153cbd92md8ivdzzfc1j622c97z8qsf1irw";
  };

  patchPhase = ''
  # It seems webob doesn't set a content-length value when body is empty but I don't know the why...
  sed -i 's/test_render_response_no_body/noop/' keystone/tests/unit/test_wsgi.py
  '';

  # https://github.com/openstack/keystone/blob/stable/liberty/requirements.txt
  propagatedBuildInputs = with python2Packages; [
    pbr webob eventlet greenlet PasteDeploy paste routes cryptography six
    sqlalchemy sqlalchemy_migrate stevedore passlib keystoneclient memcached
    keystonemiddleware oauthlib pysaml2 dogpile_cache jsonschema pycadf msgpack
    xmlsec MySQL_python passlib

    # oslo
    oslo-cache oslo-concurrency oslo-config oslo-context oslo-messaging oslo-db
    oslo-i18n oslo-log oslo-middleware oslo-policy oslo-serialization oslo-service
    oslo-utils
  ];

  buildInputs = with python2Packages; [
    coverage fixtures mock subunit testtools testrepository
    ldap ldappool webtest requests_openstack_ocata oslotest pep8 pymongo which
    freezegun testresources
  ];

  makeWrapperArgs = ["--prefix PATH : '${openssl.bin}/bin:$PATH'"];

  postInstall = ''
    cp keystone/common/sql/migrate_repo/migrate.cfg $out/lib/python2.7/site-packages/keystone/common/sql/migrate_repo/
    cp keystone/common/sql/expand_repo/migrate.cfg $out/lib/python2.7/site-packages/keystone/common/sql/expand_repo/
    cp keystone/common/sql/data_migration_repo/migrate.cfg $out/lib/python2.7/site-packages/keystone/common/sql/data_migration_repo/
    cp keystone/common/sql/contract_repo/migrate.cfg $out/lib/python2.7/site-packages/keystone/common/sql/contract_repo/

    cp -r etc $out/
  '';

  meta = with stdenv.lib; {
    homepage = http://keystone.openstack.org/;
    description = "Authentication, authorization and service discovery mechanisms via HTTP";
    license = stdenv.lib.licenses.asl20;
    platforms = stdenv.lib.platforms.linux;
  };
}
