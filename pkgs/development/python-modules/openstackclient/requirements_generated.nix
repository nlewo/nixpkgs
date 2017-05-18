{pkgs, python}:

let
  inherit (pkgs.stdenv.lib) fix';
  commonBuildInputs = with pkgs; [ libffi openssl ];
  commonDoCheck = false;
  

  generated = self: {

    "Babel" = python.mkDerivation {
      name = "Babel-2.3.4";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/6e/96/ba2a2462ed25ca0e651fb7b66e7080f5315f91425a07ea5b34d7c870c114/Babel-2.3.4.tar.gz"; sha256 = "c535c4403802f6eb38173cd4863e419e2274921a01a8aad8a5b497c131c62875"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."pytz"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://babel.pocoo.org/";
        license = licenses.bsdOriginal;
        description = "Internationalization utilities";
      };
    };



    "PyYAML" = python.mkDerivation {
      name = "PyYAML-3.12";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/4a/85/db5a2df477072b2902b0eb892feb37d88ac635d36245a72a6a69b23b383a/PyYAML-3.12.tar.gz"; sha256 = "592766c6303207a20efc445587778322d7f73b161bd994f227adaa341ba212ab"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://pyyaml.org/wiki/PyYAML";
        license = licenses.mit;
        description = "YAML parser and emitter for Python";
      };
    };



    "appdirs" = python.mkDerivation {
      name = "appdirs-1.4.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/48/69/d87c60746b393309ca30761f8e2b49473d43450b150cb08f3c6df5c11be5/appdirs-1.4.3.tar.gz"; sha256 = "9e5896d1372858f8dd3344faf4e5014d21849c756c8d5701f78f8a103b372d92"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/ActiveState/appdirs";
        license = licenses.mit;
        description = "A small Python module for determining appropriate platform-specific dirs, e.g. a \"user data dir\".";
      };
    };



    "cliff" = python.mkDerivation {
      name = "cliff-2.7.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/20/2f/33128bd8522c7cabe15da58f18384985b1627a48d56a22454e78eff16388/cliff-2.7.0.tar.gz"; sha256 = "5006d8dbb95136f0cbf5e4f3e518767b3c71d6819de935646e012c3e6fca77a7"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."PyYAML"
      self."cmd2"
      self."pbr"
      self."prettytable"
      self."pyparsing"
      self."six"
      self."stevedore"
      self."unicodecsv"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://docs.openstack.org/developer/cliff";
        license = "License :: OSI Approved :: Apache Software License";
        description = "Command Line Interface Formulation Framework";
      };
    };



    "cmd2" = python.mkDerivation {
      name = "cmd2-0.7.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/9b/58/e88fda298b521e6073d4dd7f305cf661d805d1c06fd86f44ccc2f271a800/cmd2-0.7.0.tar.gz"; sha256 = "5ab76a1f07dd5fd1cc3c15ba4080265f33b80c7fd748d71bd69a51d60b30f51a"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."pyparsing"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/python-cmd2/cmd2";
        license = licenses.mit;
        description = "Extra features for standard library's cmd module";
      };
    };



    "debtcollector" = python.mkDerivation {
      name = "debtcollector-1.13.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/d9/cc/95f6a835f9bd9d90df3a08b9f9448b57fabc895c3229a104f8b0e416b655/debtcollector-1.13.0.tar.gz"; sha256 = "51476e048626f66ead094a14906a1352efbef4c718c86f351a660fa832e1da7a"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."funcsigs"
      self."pbr"
      self."six"
      self."wrapt"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://docs.openstack.org/developer/debtcollector";
        license = "License :: OSI Approved :: Apache Software License";
        description = "A collection of Python deprecation patterns and strategies that help you collect your technical debt in a non-destructive manner.";
      };
    };



    "deprecation" = python.mkDerivation {
      name = "deprecation-1.0.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/8c/e3/e5c66eba8fa2fd567065fa70ada98b990f449f74fb812b408fa7aafe82c9/deprecation-1.0.1.tar.gz"; sha256 = "b9bff5cc91f601ef2a8a0200bc6cde3f18a48c2ed3d1ecbfc16076b14b3ad935"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://deprecation.readthedocs.io/";
        license = licenses.asl20;
        description = "A library to handle automated deprecations";
      };
    };



    "funcsigs" = python.mkDerivation {
      name = "funcsigs-1.0.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/94/4a/db842e7a0545de1cdb0439bb80e6e42dfe82aaeaadd4072f2263a4fbed23/funcsigs-1.0.2.tar.gz"; sha256 = "a7bb0f2cf3a3fd1ab2732cb49eba4252c2af4240442415b4abce3b87022a8f50"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://funcsigs.readthedocs.org";
        license = "License :: OSI Approved :: Apache Software License";
        description = "Python function signatures from PEP362 for Python 2.6, 2.7 and 3.2+";
      };
    };



    "functools32" = python.mkDerivation {
      name = "functools32-3.2.3.post2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/c5/60/6ac26ad05857c601308d8fb9e87fa36d0ebf889423f47c3502ef034365db/functools32-3.2.3-2.tar.gz"; sha256 = "f6253dfbe0538ad2e387bd8fdfd9293c925d63553f5813c4e587745416501e6d"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/MiCHiLU/python-functools32";
        license = "PSF license";
        description = "Backport of the functools module from Python 3.2.3 for use on 2.7 and PyPy.";
      };
    };



    "iso8601" = python.mkDerivation {
      name = "iso8601-0.1.11";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/c0/75/c9209ee4d1b5975eb8c2cba4428bde6b61bd55664a98290dd015cdb18e98/iso8601-0.1.11.tar.gz"; sha256 = "e8fb52f78880ae063336c94eb5b87b181e6a0cc33a6c008511bac9a6e980ef30"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://bitbucket.org/micktwomey/pyiso8601";
        license = licenses.mit;
        description = "Simple module to parse ISO 8601 dates";
      };
    };



    "jsonpatch" = python.mkDerivation {
      name = "jsonpatch-1.15";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/be/c1/947048a839120acefc13a614280be3289db404901d1a2d49b6310c6d5757/jsonpatch-1.15.tar.gz"; sha256 = "ae23cd08b2f7246f8f2475363501e740c4ef93f08f2a3b7b9bcfac0cc37fceb1"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."jsonpointer"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/stefankoegl/python-json-patch";
        license = licenses.bsdOriginal;
        description = "Apply JSON-Patches (RFC 6902) ";
      };
    };



    "jsonpointer" = python.mkDerivation {
      name = "jsonpointer-1.10";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/f6/36/6bdd302303e8bc7c25102dbc1eabb3e3d97f57b0f8f414f4da7ea7ab9dd8/jsonpointer-1.10.tar.gz"; sha256 = "9fa5dcac35eefd53e25d6cd4c310d963c9f0b897641772cd6e5e7b89df7ee0b1"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/stefankoegl/python-json-pointer";
        license = licenses.bsdOriginal;
        description = "Identify specific nodes in a JSON document (RFC 6901) ";
      };
    };



    "jsonschema" = python.mkDerivation {
      name = "jsonschema-2.6.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/58/b9/171dbb07e18c6346090a37f03c7e74410a1a56123f847efed59af260a298/jsonschema-2.6.0.tar.gz"; sha256 = "6ff5f3180870836cae40f06fa10419f557208175f13ad7bc26caa77beb1f6e02"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."functools32"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/Julian/jsonschema";
        license = licenses.mit;
        description = "An implementation of JSON Schema validation for Python";
      };
    };



    "keystoneauth1" = python.mkDerivation {
      name = "keystoneauth1-2.20.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/a4/e1/20603fb19b8b4fe7e500c0235661e91f1394f219f565e8a17f9c8c8f5307/keystoneauth1-2.20.0.tar.gz"; sha256 = "6bb45250f2e716302f9572f3f5440baf4b7339a93e0ea33c38ac501294da9b2e"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."iso8601"
      self."pbr"
      self."positional"
      self."requests"
      self."six"
      self."stevedore"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://docs.openstack.org/developer/keystoneauth/";
        license = "License :: OSI Approved :: Apache Software License";
        description = "Authentication Library for OpenStack Identity";
      };
    };



    "monotonic" = python.mkDerivation {
      name = "monotonic-1.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/96/b3/3e9fa0bdf132a971571cbf0e3f0c8b38834f4f7af8ca9523794f4f5895e0/monotonic-1.3.tar.gz"; sha256 = "2b469e2d7dd403f7f7f79227fe5ad551ee1e76f8bb300ae935209884b93c7c1b"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/atdt/monotonic";
        license = "License :: OSI Approved :: Apache Software License";
        description = "An implementation of time.monotonic() for Python 2 & < 3.3";
      };
    };



    "msgpack-python" = python.mkDerivation {
      name = "msgpack-python-0.4.8";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/21/27/8a1d82041c7a2a51fcc73675875a5f9ea06c2663e02fcfeb708be1d081a0/msgpack-python-0.4.8.tar.gz"; sha256 = "1a2b19df0f03519ec7f19f826afb935b202d8979b0856c6fb3dc28955799f886"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://msgpack.org/";
        license = "License :: OSI Approved :: Apache Software License";
        description = "MessagePack (de)serializer.";
      };
    };



    "netaddr" = python.mkDerivation {
      name = "netaddr-0.7.19";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/0c/13/7cbb180b52201c07c796243eeff4c256b053656da5cfe3916c3f5b57b3a0/netaddr-0.7.19.tar.gz"; sha256 = "38aeec7cdd035081d3a4c306394b19d677623bf76fa0913f6695127c7753aefd"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/drkjam/netaddr/";
        license = licenses.bsdOriginal;
        description = "A network address manipulation library for Python";
      };
    };



    "netifaces" = python.mkDerivation {
      name = "netifaces-0.10.5";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/a7/4c/8e0771a59fd6e55aac993a7cc1b6a0db993f299514c464ae6a1ecf83b31d/netifaces-0.10.5.tar.gz"; sha256 = "59d8ad52dd3116fcb6635e175751b250dc783fb011adba539558bd764e5d628b"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://bitbucket.org/al45tair/netifaces";
        license = licenses.mit;
        description = "Portable network interface information.";
      };
    };



    "openstacksdk" = python.mkDerivation {
      name = "openstacksdk-0.9.16";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/31/36/64feff485c6b02feb99a3bec0ee3af06806670308b4cc459d84578f858e2/openstacksdk-0.9.16.tar.gz"; sha256 = "d22aa764fbc65231f3247085a85036942c72d34470459d1bdbbb726a02b7adde"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."deprecation"
      self."keystoneauth1"
      self."os-client-config"
      self."pbr"
      self."six"
      self."stevedore"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://developer.openstack.org/sdks/python/openstacksdk/";
        license = "License :: OSI Approved :: Apache Software License";
        description = "An SDK for building applications to work with OpenStack";
      };
    };



    "os-client-config" = python.mkDerivation {
      name = "os-client-config-1.27.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/2e/f7/0c10b3fb0c90c16f65996cd201178a936114f58def5d9709b761987d34e3/os-client-config-1.27.0.tar.gz"; sha256 = "582bb742b9106865d9ce0808a74d3ab5cc6546dc099cbadb3e63a25770445c59"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."PyYAML"
      self."appdirs"
      self."keystoneauth1"
      self."requestsexceptions"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://docs.openstack.org/developer/os-client-config/";
        license = "License :: OSI Approved :: Apache Software License";
        description = "OpenStack Client Configuation Library";
      };
    };



    "osc-lib" = python.mkDerivation {
      name = "osc-lib-1.6.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/d7/c6/9edd96de19086b3e83ae27d315c426f0beaaf94619c3d780901d42cd5a3f/osc-lib-1.6.0.tar.gz"; sha256 = "aba7faca983af4bea85fb4977bb94ea136d0ff04ebcdddcffeabad9ad6cce599"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Babel"
      self."cliff"
      self."keystoneauth1"
      self."os-client-config"
      self."oslo.i18n"
      self."oslo.utils"
      self."pbr"
      self."simplejson"
      self."six"
      self."stevedore"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://docs.openstack.org/developer/osc-lib";
        license = "License :: OSI Approved :: Apache Software License";
        description = "OpenStackClient Library";
      };
    };



    "oslo.config" = python.mkDerivation {
      name = "oslo.config-4.1.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/14/7d/fd25e1a04c7961f0222fc4c264508bd1a96cec401976461860b1e134dbfb/oslo.config-4.1.1.tar.gz"; sha256 = "00368b09d352f8ad829d94263a58845e86749491dc4cb690dee678f4cc8eebea"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."debtcollector"
      self."netaddr"
      self."oslo.i18n"
      self."rfc3986"
      self."six"
      self."stevedore"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://docs.openstack.org/developer/oslo.config/";
        license = "License :: OSI Approved :: Apache Software License";
        description = "Oslo Configuration API";
      };
    };



    "oslo.i18n" = python.mkDerivation {
      name = "oslo.i18n-3.15.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/2e/c3/ec2125572d482d94150065b76d7218a32aac940af761e8b57096ae321382/oslo.i18n-3.15.1.tar.gz"; sha256 = "847b224c023fc57ac39ea9b7a97b99877088cbd1fb89a1a33ae0217e624d43df"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Babel"
      self."pbr"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://docs.openstack.org/developer/oslo.i18n";
        license = "License :: OSI Approved :: Apache Software License";
        description = "Oslo i18n library";
      };
    };



    "oslo.serialization" = python.mkDerivation {
      name = "oslo.serialization-2.18.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/37/16/f1441bd08d68043a839f745f354446c82d0fb5fcc9031a26f17907c59552/oslo.serialization-2.18.0.tar.gz"; sha256 = "0947922f41691f77593d0574382d4bacdb471eeed28108903567415471f276be"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."msgpack-python"
      self."oslo.utils"
      self."pbr"
      self."pytz"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://docs.openstack.org/developer/oslo.serialization/";
        license = "License :: OSI Approved :: Apache Software License";
        description = "Oslo Serialization library";
      };
    };



    "oslo.utils" = python.mkDerivation {
      name = "oslo.utils-3.25.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/d6/5a/a9f93594f76f9f99b2bbaca32770811e72ba5047843c764e5e45846e30cd/oslo.utils-3.25.1.tar.gz"; sha256 = "41076d625d298ac8f8240332738ae662d63d2b95601dbe7d021b3b6265b1651c"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."debtcollector"
      self."funcsigs"
      self."iso8601"
      self."monotonic"
      self."netaddr"
      self."netifaces"
      self."oslo.i18n"
      self."pbr"
      self."pyparsing"
      self."pytz"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://docs.openstack.org/developer/oslo.utils/";
        license = "License :: OSI Approved :: Apache Software License";
        description = "Oslo Utility library";
      };
    };



    "pbr" = python.mkDerivation {
      name = "pbr-3.0.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/1e/f0/9963f6ff9fb3861384be272c07522a9e85441ea5524f7fe15d07cadcae2a/pbr-3.0.0.tar.gz"; sha256 = "568f988af109114fbfa0525dcb6836b069838360d11732736ecc82e4c15d5c12"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://docs.openstack.org/developer/pbr/";
        license = "License :: OSI Approved :: Apache Software License";
        description = "Python Build Reasonableness";
      };
    };



    "positional" = python.mkDerivation {
      name = "positional-1.1.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/83/73/1e2c630d868b73ecdea381ad7b081bc53888c07f1f9829699d277a2859a8/positional-1.1.1.tar.gz"; sha256 = "ef845fa46ee5a11564750aaa09dd7db059aaf39c44c901b37181e5ffa67034b0"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."pbr"
      self."wrapt"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/morganfainberg/positional";
        license = "License :: OSI Approved :: Apache Software License";
        description = "Library to enforce positional or key-word arguments";
      };
    };



    "prettytable" = python.mkDerivation {
      name = "prettytable-0.7.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/ef/30/4b0746848746ed5941f052479e7c23d2b56d174b82f4fd34a25e389831f5/prettytable-0.7.2.tar.bz2"; sha256 = "853c116513625c738dc3ce1aee148b5b5757a86727e67eff6502c7ca59d43c36"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://code.google.com/p/prettytable";
        license = licenses.bsdOriginal;
        description = "A simple Python library for easily displaying tabular data in a visually appealing ASCII table format";
      };
    };



    "pyparsing" = python.mkDerivation {
      name = "pyparsing-2.2.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/3c/ec/a94f8cf7274ea60b5413df054f82a8980523efd712ec55a59e7c3357cf7c/pyparsing-2.2.0.tar.gz"; sha256 = "0832bcf47acd283788593e7a0f542407bd9550a55a8a8435214a1960e04bcb04"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://pyparsing.wikispaces.com/";
        license = licenses.mit;
        description = "Python parsing module";
      };
    };



    "python-cinderclient" = python.mkDerivation {
      name = "python-cinderclient-2.0.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/46/f1/a2cbf4f76d2e5a9bf357c9f4374cfff30ebbd198b6422801554de4d51abf/python-cinderclient-2.0.1.tar.gz"; sha256 = "d86d753d47fe142e323d2c3885f8e0a0295b7105d71e241e3a6b5fa83b910df2"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Babel"
      self."keystoneauth1"
      self."oslo.i18n"
      self."oslo.utils"
      self."pbr"
      self."prettytable"
      self."requests"
      self."simplejson"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://docs.openstack.org/developer/python-cinderclient";
        license = "License :: OSI Approved :: Apache Software License";
        description = "OpenStack Block Storage API Client Library";
      };
    };



    "python-glanceclient" = python.mkDerivation {
      name = "python-glanceclient-2.6.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/9d/8a/064a266260b42fb6f103c691dda7dffe51f55d27eb20d7fb4473c7e4560a/python-glanceclient-2.6.0.tar.gz"; sha256 = "59ce6ec4cb17e6cb5b94e12d4563a1b6fe2f6dd11c8e1d4e42e45073c76bcc0b"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Babel"
      self."keystoneauth1"
      self."oslo.i18n"
      self."oslo.utils"
      self."pbr"
      self."prettytable"
      self."requests"
      self."six"
      self."warlock"
      self."wrapt"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://docs.openstack.org/developer/python-glanceclient";
        license = licenses.asl20;
        description = "OpenStack Image API Client Library";
      };
    };



    "python-keystoneclient" = python.mkDerivation {
      name = "python-keystoneclient-3.10.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/56/c3/e808e30c7a0b5be8702f24e8c740b50cafe105ef6973624c9a5b258bd85f/python-keystoneclient-3.10.0.tar.gz"; sha256 = "c65fa56791ec02dc942ad08e5c3634b8dca98eda76ee3c2549018b6767e67918"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."debtcollector"
      self."keystoneauth1"
      self."oslo.config"
      self."oslo.i18n"
      self."oslo.serialization"
      self."oslo.utils"
      self."pbr"
      self."positional"
      self."requests"
      self."six"
      self."stevedore"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://docs.openstack.org/developer/python-keystoneclient";
        license = "License :: OSI Approved :: Apache Software License";
        description = "Client Library for OpenStack Identity";
      };
    };



    "python-novaclient" = python.mkDerivation {
      name = "python-novaclient-8.0.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/bf/78/e0fb24eda8b6870d30f233292c6a3cdc8f0adbffd24f3ba645f8ddee6827/python-novaclient-8.0.0.tar.gz"; sha256 = "31bb67ba055f926090d69039508ee54df645aaf3beeec88095f8ce7283a35da4"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Babel"
      self."iso8601"
      self."keystoneauth1"
      self."oslo.i18n"
      self."oslo.serialization"
      self."oslo.utils"
      self."pbr"
      self."prettytable"
      self."requests"
      self."simplejson"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://docs.openstack.org/developer/python-novaclient";
        license = licenses.asl20;
        description = "Client library for OpenStack Compute API";
      };
    };



    "python-openstackclient" = python.mkDerivation {
      name = "python-openstackclient-3.11.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/cb/b8/f014b565e7c9280616338e476955129fb8cd02bc13ffff5858814eb71afe/python-openstackclient-3.11.0.tar.gz"; sha256 = "79fc71a0234f212fc4cccb53b64763be7753e02c1666957a6210b16e8c68c2f6"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Babel"
      self."cliff"
      self."keystoneauth1"
      self."openstacksdk"
      self."osc-lib"
      self."oslo.i18n"
      self."oslo.utils"
      self."pbr"
      self."python-cinderclient"
      self."python-glanceclient"
      self."python-keystoneclient"
      self."python-novaclient"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://docs.openstack.org/developer/python-openstackclient";
        license = "License :: OSI Approved :: Apache Software License";
        description = "OpenStack Command-line Client";
      };
    };



    "pytz" = python.mkDerivation {
      name = "pytz-2017.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/a4/09/c47e57fc9c7062b4e83b075d418800d322caa87ec0ac21e6308bd3a2d519/pytz-2017.2.zip"; sha256 = "f5c056e8f62d45ba8215e5cb8f50dfccb198b4b9fbea8500674f3443e4689589"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://pythonhosted.org/pytz";
        license = licenses.mit;
        description = "World timezone definitions, modern and historical";
      };
    };



    "requests" = python.mkDerivation {
      name = "requests-2.14.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/72/46/4abc3f5aaf7bf16a52206bb0c68677a26c216c1e6625c78c5aef695b5359/requests-2.14.2.tar.gz"; sha256 = "a274abba399a23e8713ffd2b5706535ae280ebe2b8069ee6a941cb089440d153"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://python-requests.org";
        license = licenses.asl20;
        description = "Python HTTP for Humans.";
      };
    };



    "requestsexceptions" = python.mkDerivation {
      name = "requestsexceptions-1.2.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/64/61/61907e515f08cd550bac200696d66ee518fac0d7d7aa7fcfe855fe5de546/requestsexceptions-1.2.0.tar.gz"; sha256 = "8b762ba6ec5f4f5af50bdd3ab07184a0e63803d70e8b1bbbd429a8f5216fe13d"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."pbr"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://www.openstack.org/";
        license = "License :: OSI Approved :: Apache Software License";
        description = "Import exceptions from potentially bundled packages in requests.";
      };
    };



    "rfc3986" = python.mkDerivation {
      name = "rfc3986-1.0.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/52/ee/d5136880f56124317fb4d9ce5cb39286802585ea908d2b6d7cba48d9c5d1/rfc3986-1.0.0.tar.gz"; sha256 = "2faacfabcc13ed89b061b5f21cbbf330f82400654b317b5907d311c3478ec4c4"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://rfc3986.readthedocs.io";
        license = licenses.asl20;
        description = "Validating URI References per RFC 3986";
      };
    };



    "simplejson" = python.mkDerivation {
      name = "simplejson-3.10.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/40/ad/52c1f3a562df3b210e8f165e1aa243a178c454ead65476a39fa3ce1847b6/simplejson-3.10.0.tar.gz"; sha256 = "953be622e88323c6f43fad61ffd05bebe73b9fd9863a46d68b052d2aa7d71ce2"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/simplejson/simplejson";
        license = licenses.mit;
        description = "Simple, fast, extensible JSON encoder/decoder for Python";
      };
    };



    "six" = python.mkDerivation {
      name = "six-1.10.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/b3/b2/238e2590826bfdd113244a40d9d3eb26918bd798fc187e2360a8367068db/six-1.10.0.tar.gz"; sha256 = "105f8d68616f8248e24bf0e9372ef04d3cc10104f1980f54d57b2ce73a5ad56a"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://pypi.python.org/pypi/six/";
        license = licenses.mit;
        description = "Python 2 and 3 compatibility utilities";
      };
    };



    "stevedore" = python.mkDerivation {
      name = "stevedore-1.21.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/6e/a6/0686e6aa6c60ab8128439de0476a83ab5c28c7fa3381128f3395b0cf27c1/stevedore-1.21.0.tar.gz"; sha256 = "aa0e64490e9eef9f0ae96a3b226f963ebf54bb6a38176472d76253d015424f8b"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."pbr"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://docs.openstack.org/developer/stevedore/";
        license = "License :: OSI Approved :: Apache Software License";
        description = "Manage dynamic plugins for Python applications";
      };
    };



    "unicodecsv" = python.mkDerivation {
      name = "unicodecsv-0.14.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/6f/a4/691ab63b17505a26096608cc309960b5a6bdf39e4ba1a793d5f9b1a53270/unicodecsv-0.14.1.tar.gz"; sha256 = "018c08037d48649a0412063ff4eda26eaa81eff1546dbffa51fa5293276ff7fc"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/jdunck/python-unicodecsv";
        license = licenses.bsdOriginal;
        description = "Python2's stdlib csv module is nice, but it doesn't support unicode. This module is a drop-in replacement which *does*.";
      };
    };



    "warlock" = python.mkDerivation {
      name = "warlock-1.2.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/0f/d4/408b936a3d9214b7685c35936bb59d9254c70ff319ee6a837b9efcf5615e/warlock-1.2.0.tar.gz"; sha256 = "7c0d17891e14cf77e13a598edecc9f4682a5bc8a219dc84c139c5ba02789ef5a"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."jsonpatch"
      self."jsonschema"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/bcwaldon/warlock";
        license = "";
        description = "Python object model built on JSON schema and JSON patch.";
      };
    };



    "wrapt" = python.mkDerivation {
      name = "wrapt-1.10.10";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/a3/bb/525e9de0a220060394f4aa34fdf6200853581803d92714ae41fc3556e7d7/wrapt-1.10.10.tar.gz"; sha256 = "42160c91b77f1bc64a955890038e02f2f72986c01d462d53cb6cb039b995cdd9"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/GrahamDumpleton/wrapt";
        license = licenses.bsdOriginal;
        description = "Module for decorators, wrappers and monkey patching.";
      };
    };

  };
in fix' generated

