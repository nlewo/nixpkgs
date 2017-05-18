{ pkgs, stdenv, fetchurl, python2Packages, xmlsec, which, openssl }:

let 
  python = { mkDerivation = pkgs.pythonPackages.buildPythonPackage; };
  self = import ./requirements_generated.nix { inherit pkgs python; } ;
in
python2Packages.buildPythonApplication rec {
  name = "keystone-${version}";
  version = "11.0.0";
  namePrefix = "";

  PBR_VERSION = "${version}";

  doCheck = false;

  src = fetchurl {
    url = "https://github.com/openstack/keystone/archive/${version}.tar.gz";
    sha256 = "0la6xrvili5sm6zkl153cbd92md8ivdzzfc1j622c97z8qsf1irw";
  };

  postInstall = ''
    cp keystone/common/sql/migrate_repo/migrate.cfg $out/lib/python2.7/site-packages/keystone/common/sql/migrate_repo/
    cp keystone/common/sql/expand_repo/migrate.cfg $out/lib/python2.7/site-packages/keystone/common/sql/expand_repo/
    cp keystone/common/sql/data_migration_repo/migrate.cfg $out/lib/python2.7/site-packages/keystone/common/sql/data_migration_repo/
    cp keystone/common/sql/contract_repo/migrate.cfg $out/lib/python2.7/site-packages/keystone/common/sql/contract_repo/

    cp -r etc $out/
  '';

  propagatedBuildInputs = [ self."Babel" self."Jinja2" self."Mako" self."MarkupSafe" self."Paste" self."PasteDeploy" self."PyYAML" self."Routes" self."SQLAlchemy" self."Tempita" self."WebOb" self."alembic" self."amqp" self."appdirs" self."asn1crypto" self."cachetools" self."cffi" self."contextlib2" self."cryptography" self."debtcollector" self."decorator" self."dogpile.cache" self."enum-compat" self."enum34" self."eventlet" self."fasteners" self."funcsigs" self."functools32" self."futures" self."futurist" self."greenlet" self."idna" self."ipaddress" self."iso8601" self."jsonschema" self."keystoneauth1" self."keystonemiddleware" self."kombu" self."monotonic" self."msgpack-python" self."netaddr" self."netifaces" self."oauthlib" self."oslo.cache" self."oslo.concurrency" self."oslo.config" self."oslo.context" self."oslo.db" self."oslo.i18n" self."oslo.log" self."oslo.messaging" self."oslo.middleware" self."oslo.policy" self."oslo.serialization" self."oslo.service" self."oslo.utils" self."osprofiler" self."packaging" self."passlib" self."pbr" self."pika" self."pika-pool" self."positional" self."prettytable" self."pyOpenSSL" self."pycadf" self."pycparser" self."pycrypto" self."pyinotify" self."pyparsing" self."pysaml2" self."python-dateutil" self."python-editor" self."python-keystoneclient" self."pytz" self."repoze.lru" self."repoze.who" self."requests" self."rfc3986" self."six" self."sqlalchemy-migrate" self."sqlparse" self."statsd" self."stevedore" self."tenacity" self."vine" self."wrapt" self."zope.interface" ] ++ [ python2Packages.MySQL_python ];
}
