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



    "Jinja2" = python.mkDerivation {
      name = "Jinja2-2.9.6";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/90/61/f820ff0076a2599dd39406dcb858ecb239438c02ce706c8e91131ab9c7f1/Jinja2-2.9.6.tar.gz"; sha256 = "ddaa01a212cd6d641401cb01b605f4a4d9f37bfc93043d7f760ec70fb99ff9ff"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Babel"
      self."MarkupSafe"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://jinja.pocoo.org/";
        license = licenses.bsdOriginal;
        description = "A small but fast and easy to use stand-alone template engine written in pure python.";
      };
    };



    "Mako" = python.mkDerivation {
      name = "Mako-1.0.6";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/56/4b/cb75836863a6382199aefb3d3809937e21fa4cb0db15a4f4ba0ecc2e7e8e/Mako-1.0.6.tar.gz"; sha256 = "48559ebd872a8e77f92005884b3d88ffae552812cdf17db6768e5c3be5ebbe0d"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."MarkupSafe"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://www.makotemplates.org/";
        license = licenses.mit;
        description = "A super-fast templating language that borrows the  best ideas from the existing templating languages.";
      };
    };



    "MarkupSafe" = python.mkDerivation {
      name = "MarkupSafe-1.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/4d/de/32d741db316d8fdb7680822dd37001ef7a448255de9699ab4bfcbdf4172b/MarkupSafe-1.0.tar.gz"; sha256 = "a6be69091dac236ea9c6bc7d012beab42010fa914c459791d627dad4910eb665"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/pallets/markupsafe";
        license = licenses.bsdOriginal;
        description = "Implements a XML/HTML/XHTML Markup safe string for Python";
      };
    };



    "Paste" = python.mkDerivation {
      name = "Paste-2.0.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/30/c3/5c2f7c7a02e4f58d4454353fa1c32c94f79fa4e36d07a67c0ac295ea369e/Paste-2.0.3.tar.gz"; sha256 = "2346a347824c32641bf020c17967b49ae74d3310ec1bc9b958d4b84e2d985218"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://pythonpaste.org";
        license = licenses.mit;
        description = "Tools for using a Web Server Gateway Interface stack";
      };
    };



    "PasteDeploy" = python.mkDerivation {
      name = "PasteDeploy-1.5.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/0f/90/8e20cdae206c543ea10793cbf4136eb9a8b3f417e04e40a29d72d9922cbd/PasteDeploy-1.5.2.tar.gz"; sha256 = "d5858f89a255e6294e63ed46b73613c56e3b9a2d82a42f1df4d06c8421a9e3cb"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Paste"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://pythonpaste.org/deploy/";
        license = licenses.mit;
        description = "Load, configure, and compose WSGI applications and servers";
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



    "Routes" = python.mkDerivation {
      name = "Routes-2.4.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/33/38/ea827837e68d9c7dde4cff7ec122a93c319f0effc08ce92a17095576603f/Routes-2.4.1.tar.gz"; sha256 = "26ee43340fca5a32769ffe0c58edcb396ccce6bc1dfa689ddf844d50877355fd"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."WebOb"
      self."repoze.lru"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://routes.readthedocs.io/";
        license = licenses.mit;
        description = "Routing Recognition and Generation Tools";
      };
    };



    "SQLAlchemy" = python.mkDerivation {
      name = "SQLAlchemy-1.0.17";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/dc/a9/ddd8c9f479c81c0b52149897e38a85a3bb6fa4adbe4a8042886ca1505d8c/SQLAlchemy-1.0.17.tar.gz"; sha256 = "4352b8ddc625fe648e9e93929fa217c234d7b1a1a2412a3021924b5c2bd95194"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://www.sqlalchemy.org";
        license = licenses.mit;
        description = "Database Abstraction Library";
      };
    };



    "Tempita" = python.mkDerivation {
      name = "Tempita-0.5.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/56/c8/8ed6eee83dbddf7b0fc64dd5d4454bc05e6ccaafff47991f73f2894d9ff4/Tempita-0.5.2.tar.gz"; sha256 = "cacecf0baa674d356641f1d406b8bff1d756d739c46b869a54de515d08e6fc9c"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://pythonpaste.org/tempita/";
        license = licenses.mit;
        description = "A very small text templating language";
      };
    };



    "WebOb" = python.mkDerivation {
      name = "WebOb-1.7.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/1a/2b/322d6e01ba19c1e28349efe46dab1bd480c81a55af0658d63dc48ed62ee6/WebOb-1.7.2.tar.gz"; sha256 = "0dc8b30bdbf15d8fd1a967e30ece3357f2f468206354f69213e57b30a63f0039"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://webob.org/";
        license = licenses.mit;
        description = "WSGI request and response object";
      };
    };



    "alembic" = python.mkDerivation {
      name = "alembic-0.9.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/97/00/3e6797a2e4209db69d23b223ae3148d5f3605dafba6a332670de7a12c147/alembic-0.9.1.tar.gz"; sha256 = "767cf6c8c4578f1f625f17bfbc8716a7d4f80a0c1efc7a9b72af30ad68954962"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Mako"
      self."SQLAlchemy"
      self."python-editor"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://bitbucket.org/zzzeek/alembic";
        license = licenses.mit;
        description = "A database migration tool for SQLAlchemy.";
      };
    };



    "amqp" = python.mkDerivation {
      name = "amqp-2.1.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/4d/95/565c868032280757210295262fd593d74eb2cd6d359e5b85031a7628627d/amqp-2.1.3.tar.gz"; sha256 = "e8e5c45d6858bbd2814123a61487537804b1101e9be114d1b7c935c04bdd4ee8"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."vine"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/celery/py-amqp";
        license = licenses.bsdOriginal;
        description = "Low-level AMQP client for Python (fork of amqplib).";
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



    "asn1crypto" = python.mkDerivation {
      name = "asn1crypto-0.22.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/67/14/5d66588868c4304f804ebaff9397255f6ec5559e46724c2496e0f26e68d6/asn1crypto-0.22.0.tar.gz"; sha256 = "cbbadd640d3165ab24b06ef25d1dca09a3441611ac15f6a6b452474fdf0aed1a"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/wbond/asn1crypto";
        license = licenses.mit;
        description = "Fast ASN.1 parser and serializer with definitions for private keys, public keys, certificates, CRL, OCSP, CMS, PKCS#3, PKCS#7, PKCS#8, PKCS#12, PKCS#5, X.509 and TSP";
      };
    };



    "cachetools" = python.mkDerivation {
      name = "cachetools-2.0.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/dc/64/16cbf95e0ac473503c5dcd61aefbbab9f12e1875f40a0aaff566a1236ac4/cachetools-2.0.0.tar.gz"; sha256 = "715a7202240dc20dbe83abdb2d804d543e2d4f07af146f53c82166bd75f3a628"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/tkem/cachetools";
        license = licenses.mit;
        description = "Extensible memoizing collections and decorators";
      };
    };



    "cffi" = python.mkDerivation {
      name = "cffi-1.10.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/5b/b9/790f8eafcdab455bcd3bd908161f802c9ce5adbf702a83aa7712fcc345b7/cffi-1.10.0.tar.gz"; sha256 = "b3b02911eb1f6ada203b0763ba924234629b51586f72a21faacc638269f4ced5"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."pycparser"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://cffi.readthedocs.org";
        license = licenses.mit;
        description = "Foreign Function Interface for Python calling C code.";
      };
    };



    "contextlib2" = python.mkDerivation {
      name = "contextlib2-0.5.5";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/6e/db/41233498c210b03ab8b072c8ee49b1cd63b3b0c76f8ea0a0e5d02df06898/contextlib2-0.5.5.tar.gz"; sha256 = "509f9419ee91cdd00ba34443217d5ca51f5a364a404e1dce9e8979cea969ca48"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://contextlib2.readthedocs.org";
        license = licenses.psfl;
        description = "Backports and enhancements for the contextlib module";
      };
    };



    "cryptography" = python.mkDerivation {
      name = "cryptography-1.8.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/ec/5f/d5bc241d06665eed93cd8d3aa7198024ce7833af7a67f6dc92df94e00588/cryptography-1.8.1.tar.gz"; sha256 = "323524312bb467565ebca7e50c8ae5e9674e544951d28a2904a50012a8828190"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."asn1crypto"
      self."cffi"
      self."enum34"
      self."idna"
      self."ipaddress"
      self."iso8601"
      self."packaging"
      self."pytz"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/pyca/cryptography";
        license = licenses.bsdOriginal;
        description = "cryptography is a package which provides cryptographic recipes and primitives to Python developers.";
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



    "decorator" = python.mkDerivation {
      name = "decorator-4.0.11";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/cc/ac/5a16f1fc0506ff72fcc8fd4e858e3a1c231f224ab79bb7c4c9b2094cc570/decorator-4.0.11.tar.gz"; sha256 = "953d6bf082b100f43229cf547f4f97f97e970f5ad645ee7601d55ff87afdfe76"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/micheles/decorator";
        license = licenses.bsdOriginal;
        description = "Better living through Python with decorators";
      };
    };



    "dogpile.cache" = python.mkDerivation {
      name = "dogpile.cache-0.6.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/9d/a9/ba70aadc6170841a1c6145e9039d4b1c2a4ef8c44cd0ca9b09ab79be9120/dogpile.cache-0.6.2.tar.gz"; sha256 = "73793471af07af6dc5b3ee015abfaca4220caaa34c615537f5ab007ed150726d"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://bitbucket.org/zzzeek/dogpile.cache";
        license = licenses.bsdOriginal;
        description = "A caching front-end based on the Dogpile lock.";
      };
    };



    "enum-compat" = python.mkDerivation {
      name = "enum-compat-0.0.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/95/6e/26bdcba28b66126f66cf3e4cd03bcd63f7ae330d29ee68b1f6b623550bfa/enum-compat-0.0.2.tar.gz"; sha256 = "939ceff18186a5762ae4db9fa7bfe017edbd03b66526b798dd8245394c8a4192"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."enum34"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/jstasiak/enum-compat";
        license = licenses.mit;
        description = "enum/enum34 compatibility package";
      };
    };



    "enum34" = python.mkDerivation {
      name = "enum34-1.1.6";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/bf/3e/31d502c25302814a7c2f1d3959d2a3b3f78e509002ba91aea64993936876/enum34-1.1.6.tar.gz"; sha256 = "8ad8c4783bf61ded74527bffb48ed9b54166685e4230386a9ed9b1279e2df5b1"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://bitbucket.org/stoneleaf/enum34";
        license = licenses.bsdOriginal;
        description = "Python 3.4 Enum backported to 3.3, 3.2, 3.1, 2.7, 2.6, 2.5, and 2.4";
      };
    };



    "eventlet" = python.mkDerivation {
      name = "eventlet-0.21.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/cb/ec/eae487c106a7e38f86ac4cadafb3eec77d29996f64ca0c7015067538069b/eventlet-0.21.0.tar.gz"; sha256 = "08faffab88c1b08bd53ea28bf084a572c89f7e7648bd9d71e6116ac17a51a15d"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."enum-compat"
      self."greenlet"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://eventlet.net";
        license = licenses.mit;
        description = "Highly concurrent networking library";
      };
    };



    "fasteners" = python.mkDerivation {
      name = "fasteners-0.14.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/f4/6f/41b835c9bf69b03615630f8a6f6d45dafbec95eb4e2bb816638f043552b2/fasteners-0.14.1.tar.gz"; sha256 = "427c76773fe036ddfa41e57d89086ea03111bbac57c55fc55f3006d027107e18"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."monotonic"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/harlowja/fasteners";
        license = "License :: OSI Approved :: Apache Software License";
        description = "A python package that provides useful locks.";
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



    "futures" = python.mkDerivation {
      name = "futures-3.1.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/cc/26/b61e3a4eb50653e8a7339d84eeaa46d1e93b92951978873c220ae64d0733/futures-3.1.1.tar.gz"; sha256 = "51ecb45f0add83c806c68e4b06106f90db260585b25ef2abfcda0bd95c0132fd"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/agronholm/pythonfutures";
        license = licenses.psfl;
        description = "Backport of the concurrent.futures package from Python 3.2";
      };
    };



    "futurist" = python.mkDerivation {
      name = "futurist-1.1.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/80/1e/52da588287f731a48bda5392735c43f8dc9f812a22e0cc733b39cd2fbcf7/futurist-1.1.0.tar.gz"; sha256 = "6587fb52f9bb91ba3b65d2efd99ccf57e05fcce35dd849f32268c727e67ec554"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."contextlib2"
      self."futures"
      self."monotonic"
      self."pbr"
      self."prettytable"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://docs.openstack.org/developer/futurist";
        license = "License :: OSI Approved :: Apache Software License";
        description = "Useful additions to futures, from the future.";
      };
    };



    "greenlet" = python.mkDerivation {
      name = "greenlet-0.4.12";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/be/76/82af375d98724054b7e273b5d9369346937324f9bcc20980b45b068ef0b0/greenlet-0.4.12.tar.gz"; sha256 = "e4c99c6010a5d153d481fdaf63b8a0782825c0721506d880403a3b9b82ae347e"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/python-greenlet/greenlet";
        license = licenses.mit;
        description = "Lightweight in-process concurrent programming";
      };
    };



    "idna" = python.mkDerivation {
      name = "idna-2.5";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/d8/82/28a51052215014efc07feac7330ed758702fc0581347098a81699b5281cb/idna-2.5.tar.gz"; sha256 = "3cb5ce08046c4e3a560fc02f138d0ac63e00f8ce5901a56b32ec8b7994082aab"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/kjd/idna";
        license = licenses.bsdOriginal;
        description = "Internationalized Domain Names in Applications (IDNA)";
      };
    };



    "ipaddress" = python.mkDerivation {
      name = "ipaddress-1.0.18";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/4e/13/774faf38b445d0b3a844b65747175b2e0500164b7c28d78e34987a5bfe06/ipaddress-1.0.18.tar.gz"; sha256 = "5d8534c8e185f2d8a1fda1ef73f2c8f4b23264e8e30063feeb9511d492a413e1"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/phihag/ipaddress";
        license = licenses.psfl;
        description = "IPv4/IPv6 manipulation library";
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
      self."oauthlib"
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



    "keystonemiddleware" = python.mkDerivation {
      name = "keystonemiddleware-4.15.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/3f/68/7ab3749803093b8100b7a07794f0434e8859a6738380610ebc2c38f777dd/keystonemiddleware-4.15.0.tar.gz"; sha256 = "0c87bfa8e8d81425e7ea9f4ddbb5db32b57ddf2cd215abe67b1cc35fb68e90f1"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."WebOb"
      self."keystoneauth1"
      self."oslo.config"
      self."oslo.context"
      self."oslo.i18n"
      self."oslo.log"
      self."oslo.messaging"
      self."oslo.serialization"
      self."oslo.utils"
      self."pbr"
      self."positional"
      self."pycadf"
      self."python-keystoneclient"
      self."requests"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://docs.openstack.org/developer/keystonemiddleware/";
        license = "License :: OSI Approved :: Apache Software License";
        description = "Middleware for OpenStack Identity";
      };
    };



    "kombu" = python.mkDerivation {
      name = "kombu-4.0.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/d3/8e/23b6c18f90196618702fef40a5bb3642f86236f7857963caff7e82ea27ce/kombu-4.0.1.tar.gz"; sha256 = "d293c2698f6b86835f2584c63cc6283fcac1ac6bdb3e7b8ff31395da20626536"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."PyYAML"
      self."amqp"
      self."msgpack-python"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://kombu.readthedocs.io";
        license = licenses.bsdOriginal;
        description = "Messaging library for Python.";
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



    "oauthlib" = python.mkDerivation {
      name = "oauthlib-2.0.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/fa/2e/25f25e6c69d97cf921f0a8f7d520e0ef336dd3deca0142c0b634b0236a90/oauthlib-2.0.2.tar.gz"; sha256 = "b3b9b47f2a263fe249b5b48c4e25a5bce882ff20a0ac34d553ce43cff55b53ac"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."cryptography"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/idan/oauthlib";
        license = licenses.bsdOriginal;
        description = "A generic, spec-compliant, thorough implementation of the OAuth request-signing logic";
      };
    };



    "oslo.cache" = python.mkDerivation {
      name = "oslo.cache-1.21.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/95/63/4c0bad2a18e111d90a17d2d4ea1b1767ffa1cc29f906d3cdd3950bfc73fb/oslo.cache-1.21.0.tar.gz"; sha256 = "c870699129ff3cd7fc5f9158e4106fb9872114604b35886335570fba060698a7"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."dogpile.cache"
      self."oslo.config"
      self."oslo.i18n"
      self."oslo.log"
      self."oslo.utils"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://docs.openstack.org/developer/oslo.cache";
        license = "License :: OSI Approved :: Apache Software License";
        description = "Cache storage for OpenStack projects.";
      };
    };



    "oslo.concurrency" = python.mkDerivation {
      name = "oslo.concurrency-3.20.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/57/9c/cc44a59b10ca70f1001907c50ea56a3fd2c74bd8a3dd2cbb699d40ae5c84/oslo.concurrency-3.20.0.tar.gz"; sha256 = "474fc4dce9c868064915d03d110bcab7ed65330774b098d7df2e9f48e23fc36a"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."enum34"
      self."fasteners"
      self."oslo.config"
      self."oslo.i18n"
      self."oslo.utils"
      self."pbr"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://docs.openstack.org/developer/oslo.concurrency";
        license = "License :: OSI Approved :: Apache Software License";
        description = "Oslo Concurrency library";
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



    "oslo.context" = python.mkDerivation {
      name = "oslo.context-2.13.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/e6/1d/e3a277543a17c2a909453aebeb5d7617fd3c92a0844efd988f8eb467640d/oslo.context-2.13.0.tar.gz"; sha256 = "f5f733af4ff220a34d0b7ebfb7d90ed80eac308144fba4e2b9e79e2d0f25f159"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."debtcollector"
      self."pbr"
      self."positional"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://docs.openstack.org/developer/oslo.context";
        license = "License :: OSI Approved :: Apache Software License";
        description = "Oslo Context library";
      };
    };



    "oslo.db" = python.mkDerivation {
      name = "oslo.db-4.21.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/8f/45/14a190f42d5f5e84a22074bcdcbc319d7ef1ede5cb610d2fcaca42e48f81/oslo.db-4.21.0.tar.gz"; sha256 = "f95fcabec53c0fd356ccf3d25d96fc18372745d9ae84142827c6b32c8d4c5407"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."SQLAlchemy"
      self."alembic"
      self."debtcollector"
      self."eventlet"
      self."oslo.config"
      self."oslo.context"
      self."oslo.i18n"
      self."oslo.utils"
      self."pbr"
      self."six"
      self."sqlalchemy-migrate"
      self."stevedore"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://docs.openstack.org/developer/oslo.db";
        license = "License :: OSI Approved :: Apache Software License";
        description = "Oslo Database library";
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



    "oslo.log" = python.mkDerivation {
      name = "oslo.log-3.26.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/f9/23/b8446cded64caec5d64b4bccb245b06f3f9c292f2ad0542ef805308e9304/oslo.log-3.26.1.tar.gz"; sha256 = "c9feb639da3dc0e764f657847896ba65e18c7c79b83bb863919b3e207705ece6"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."debtcollector"
      self."monotonic"
      self."oslo.config"
      self."oslo.context"
      self."oslo.i18n"
      self."oslo.serialization"
      self."oslo.utils"
      self."pbr"
      self."pyinotify"
      self."python-dateutil"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://docs.openstack.org/developer/oslo.log/";
        license = "License :: OSI Approved :: Apache Software License";
        description = "oslo.log library";
      };
    };



    "oslo.messaging" = python.mkDerivation {
      name = "oslo.messaging-5.24.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/e5/ea/b3c253bd32d4ba1267382569f8f25e7deb7b369bc3f1d2b9aa33f3559059/oslo.messaging-5.24.1.tar.gz"; sha256 = "cad725c400d13631711775148cbe72073ea4b45f78acd070ac2c150374c8488c"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."PyYAML"
      self."WebOb"
      self."amqp"
      self."cachetools"
      self."debtcollector"
      self."futures"
      self."futurist"
      self."kombu"
      self."monotonic"
      self."oslo.config"
      self."oslo.i18n"
      self."oslo.log"
      self."oslo.middleware"
      self."oslo.serialization"
      self."oslo.service"
      self."oslo.utils"
      self."pbr"
      self."pika"
      self."pika-pool"
      self."six"
      self."stevedore"
      self."tenacity"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://docs.openstack.org/developer/oslo.messaging/";
        license = "License :: OSI Approved :: Apache Software License";
        description = "Oslo Messaging API";
      };
    };



    "oslo.middleware" = python.mkDerivation {
      name = "oslo.middleware-3.26.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/b3/20/54e7efa8fb91d4410cc2f6ed330cc0220b6eed24ec9676226f82ac7f8781/oslo.middleware-3.26.0.tar.gz"; sha256 = "045c7fa1d6426180e9183ad549c6aeeff02bc7929e1d917cca0051599f0f8cdb"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Jinja2"
      self."WebOb"
      self."debtcollector"
      self."oslo.config"
      self."oslo.context"
      self."oslo.i18n"
      self."oslo.utils"
      self."pbr"
      self."six"
      self."statsd"
      self."stevedore"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://docs.openstack.org/developer/oslo.middleware";
        license = "License :: OSI Approved :: Apache Software License";
        description = "Oslo Middleware library";
      };
    };



    "oslo.policy" = python.mkDerivation {
      name = "oslo.policy-1.22.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/6f/3d/e0c9b5946f8eb991911e1d9e0a4fce75eae577f9f96fc85b38c2ac41715d/oslo.policy-1.22.1.tar.gz"; sha256 = "da2849afa6ee020c199442b7909d52e136344dbecd6bc3b5b7847a4b2825d8d8"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."PyYAML"
      self."oslo.config"
      self."oslo.i18n"
      self."oslo.serialization"
      self."requests"
      self."six"
      self."stevedore"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://docs.openstack.org/developer/oslo.policy/";
        license = "License :: OSI Approved :: Apache Software License";
        description = "Oslo Policy library";
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



    "oslo.service" = python.mkDerivation {
      name = "oslo.service-1.23.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/56/f2/8a33b73a20179bf90261ef9f711c8e4dfb9fc8198e96bf2e4bb2ee2f27ab/oslo.service-1.23.0.tar.gz"; sha256 = "3eb3cb559aaff26cbef856b568374cb02428a8812b440e1eb74c485e8ff6028a"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Paste"
      self."PasteDeploy"
      self."Routes"
      self."WebOb"
      self."eventlet"
      self."greenlet"
      self."monotonic"
      self."oslo.concurrency"
      self."oslo.config"
      self."oslo.i18n"
      self."oslo.log"
      self."oslo.utils"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://docs.openstack.org/developer/oslo.service";
        license = "License :: OSI Approved :: Apache Software License";
        description = "oslo.service library";
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



    "osprofiler" = python.mkDerivation {
      name = "osprofiler-1.9.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/8e/d5/7c6e4ff374c28e60a81d0b9bb66782d9f113938add1def8440b4cf0125fb/osprofiler-1.9.0.tar.gz"; sha256 = "7133b70392d5a0c4182a68dcb598817a9fb881d336ecefe0f458798235ffebc4"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."WebOb"
      self."netaddr"
      self."oslo.concurrency"
      self."oslo.config"
      self."oslo.log"
      self."oslo.messaging"
      self."oslo.utils"
      self."requests"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://docs.openstack.org/developer/osprofiler";
        license = "License :: OSI Approved :: Apache Software License";
        description = "OpenStack Profiler Library";
      };
    };



    "packaging" = python.mkDerivation {
      name = "packaging-16.8";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/c6/70/bb32913de251017e266c5114d0a645f262fb10ebc9bf6de894966d124e35/packaging-16.8.tar.gz"; sha256 = "5d50835fdf0a7edf0b55e311b7c887786504efea1177abd7e69329a8e5ea619e"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."pyparsing"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/pypa/packaging";
        license = licenses.bsdOriginal;
        description = "Core utilities for Python packages";
      };
    };



    "passlib" = python.mkDerivation {
      name = "passlib-1.7.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/25/4b/6fbfc66aabb3017cd8c3bd97b37f769d7503ead2899bf76e570eb91270de/passlib-1.7.1.tar.gz"; sha256 = "3d948f64138c25633613f303bcc471126eae67c04d5e3f6b7b8ce6242f8653e0"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."cryptography"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://bitbucket.org/ecollins/passlib";
        license = licenses.bsdOriginal;
        description = "comprehensive password hashing framework supporting over 30 schemes";
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



    "pika" = python.mkDerivation {
      name = "pika-0.10.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/ee/25/1517ce612d7cd0a426ea027275ba74165bbfd86a2daf4bce4839afac3deb/pika-0.10.0.tar.gz"; sha256 = "7277b4d12a99efa4058782614d84138983f9f89d690bdfcea66290d810806459"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://pika.readthedocs.org ";
        license = licenses.bsdOriginal;
        description = "Pika Python AMQP Client Library";
      };
    };



    "pika-pool" = python.mkDerivation {
      name = "pika-pool-0.1.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/ec/48/50c8f02a3eef4cb824bec50661ec1713040402cc1b2a38954dc977a59c23/pika-pool-0.1.3.tar.gz"; sha256 = "f3985888cc2788cdbd293a68a8b5702a9c955db6f7b8b551aeac91e7f32da397"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."pika"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/bninja/pika-pool";
        license = licenses.bsdOriginal;
        description = "Pools for pikas.";
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



    "pyOpenSSL" = python.mkDerivation {
      name = "pyOpenSSL-17.0.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/9f/32/80fe4fddeb731b7766cd09fe0b2032a91b43dae655e216792af2a6ae3190/pyOpenSSL-17.0.0.tar.gz"; sha256 = "48abfe9d2bb8eb8d8947c8452b0223b7b1be2383b332f3b4f248fe59ef0bafdd"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."cryptography"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://pyopenssl.readthedocs.io/";
        license = licenses.asl20;
        description = "Python wrapper module around the OpenSSL library";
      };
    };



    "pycadf" = python.mkDerivation {
      name = "pycadf-2.5.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/2a/71/49f9e2a5a372009702046f895476561999171c534a9a7555559c664b8409/pycadf-2.5.0.tar.gz"; sha256 = "a5cbf899266ea25e62e927a31dbf13607f9ebfe1525b4ec95256afc42f43be70"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."debtcollector"
      self."oslo.config"
      self."oslo.serialization"
      self."pytz"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://docs.openstack.org/developer/pycadf/";
        license = "License :: OSI Approved :: Apache Software License";
        description = "CADF Library";
      };
    };



    "pycparser" = python.mkDerivation {
      name = "pycparser-2.17";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/be/64/1bb257ffb17d01f4a38d7ce686809a736837ad4371bcc5c42ba7a715c3ac/pycparser-2.17.tar.gz"; sha256 = "0aac31e917c24cb3357f5a4d5566f2cc91a19ca41862f6c3c22dc60a629673b6"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/eliben/pycparser";
        license = licenses.bsdOriginal;
        description = "C parser in Python";
      };
    };



    "pycrypto" = python.mkDerivation {
      name = "pycrypto-2.6.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/60/db/645aa9af249f059cc3a368b118de33889219e0362141e75d4eaf6f80f163/pycrypto-2.6.1.tar.gz"; sha256 = "f2ce1e989b272cfcb677616763e0a2e7ec659effa67a88aa92b3a65528f60a3c"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://www.pycrypto.org/";
        license = licenses.publicDomain;
        description = "Cryptographic modules for Python.";
      };
    };



    "pyinotify" = python.mkDerivation {
      name = "pyinotify-0.9.6";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/e3/c0/fd5b18dde17c1249658521f69598f3252f11d9d7a980c5be8619970646e1/pyinotify-0.9.6.tar.gz"; sha256 = "9c998a5d7606ca835065cdabc013ae6c66eb9ea76a00a1e3bc6e0cfe2b4f71f4"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/seb-m/pyinotify";
        license = licenses.mit;
        description = "Linux filesystem events monitoring";
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



    "pysaml2" = python.mkDerivation {
      name = "pysaml2-4.0.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/45/70/ee525fdedf7c4b2a7f6209689f9448f039a5c838c7d096b863158dc3432f/pysaml2-4.0.2.tar.gz"; sha256 = "24cec8dbc20a7772854563ffc9a19297afcc38c4c7558c063b4c8c302f8a958b"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Paste"
      self."decorator"
      self."pyOpenSSL"
      self."pycrypto"
      self."python-dateutil"
      self."pytz"
      self."repoze.who"
      self."requests"
      self."six"
      self."zope.interface"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/rohe/pysaml2";
        license = licenses.asl20;
        description = "Python implementation of SAML Version 2";
      };
    };



    "python-dateutil" = python.mkDerivation {
      name = "python-dateutil-2.6.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/51/fc/39a3fbde6864942e8bb24c93663734b74e281b984d1b8c4f95d64b0c21f6/python-dateutil-2.6.0.tar.gz"; sha256 = "62a2f8df3d66f878373fd0072eacf4ee52194ba302e00082828e0d263b0418d2"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://dateutil.readthedocs.io";
        license = licenses.bsdOriginal;
        description = "Extensions to the standard Python datetime module";
      };
    };



    "python-editor" = python.mkDerivation {
      name = "python-editor-1.0.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/65/1e/adf6e000ea5dc909aa420352d6ba37f16434c8a3c2fa030445411a1ed545/python-editor-1.0.3.tar.gz"; sha256 = "a3c066acee22a1c94f63938341d4fb374e3fdd69366ed6603d7b24bed1efc565"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/fmoo/python-editor";
        license = "License :: OSI Approved :: Apache Software License";
        description = "Programmatically open an editor, capture the result.";
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



    "repoze.lru" = python.mkDerivation {
      name = "repoze.lru-0.6";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/6e/1e/aa15cc90217e086dc8769872c8778b409812ff036bf021b15795638939e4/repoze.lru-0.6.tar.gz"; sha256 = "0f7a323bf716d3cb6cb3910cd4fccbee0b3d3793322738566ecce163b01bbd31"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://www.repoze.org";
        license = "License :: Repoze Public License";
        description = "A tiny LRU cache implementation and decorator";
      };
    };



    "repoze.who" = python.mkDerivation {
      name = "repoze.who-2.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/19/ae/94cdd6ea2d3f79a1430993ee044da1ea6fb547675e0d0ca958c71009ddde/repoze.who-2.3.tar.gz"; sha256 = "b95dadc1242acc55950115a629cfb1352669774b46d22def51400ca683efea28"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."WebOb"
      self."zope.interface"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://www.repoze.org";
        license = "BSD-derived (http://www.repoze.org/LICENSE.txt)";
        description = "repoze.who is an identification and authentication framework for WSGI.";
      };
    };



    "requests" = python.mkDerivation {
      name = "requests-2.14.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/72/46/4abc3f5aaf7bf16a52206bb0c68677a26c216c1e6625c78c5aef695b5359/requests-2.14.2.tar.gz"; sha256 = "a274abba399a23e8713ffd2b5706535ae280ebe2b8069ee6a941cb089440d153"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."cryptography"
      self."idna"
      self."pyOpenSSL"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://python-requests.org";
        license = licenses.asl20;
        description = "Python HTTP for Humans.";
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



    "sqlalchemy-migrate" = python.mkDerivation {
      name = "sqlalchemy-migrate-0.11.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/05/18/6d339bd6222f7a7613638fafc9ff4c4f0e312843d359e85489dc07b21df5/sqlalchemy-migrate-0.11.0.tar.gz"; sha256 = "e68af5e3e0561f629d4eb23d9d0ea77d2649747f2eff37fd29aece74615ca251"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."SQLAlchemy"
      self."Tempita"
      self."decorator"
      self."pbr"
      self."six"
      self."sqlparse"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://www.openstack.org/";
        license = "License :: OSI Approved :: Apache Software License";
        description = "Database schema migration for SQLAlchemy";
      };
    };



    "sqlparse" = python.mkDerivation {
      name = "sqlparse-0.2.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/45/67/14bdaeff492e6d03a055fe80502bae10b679891c25a0dc59be2fe51002f8/sqlparse-0.2.3.tar.gz"; sha256 = "becd7cc7cebbdf311de8ceedfcf2bd2403297024418801947f8c953025beeff8"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/andialbrecht/sqlparse";
        license = licenses.bsdOriginal;
        description = "Non-validating SQL parser";
      };
    };



    "statsd" = python.mkDerivation {
      name = "statsd-3.2.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/89/1e/365c87f21df573198a6e889e243fddb66755087987000a07177e80bfffea/statsd-3.2.1.tar.gz"; sha256 = "3fa92bf0192af926f7a0d9be031fe3fd0fbaa1992d42cf2f07e68f76ac18288e"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/jsocol/pystatsd";
        license = licenses.mit;
        description = "A simple statsd client.";
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



    "tenacity" = python.mkDerivation {
      name = "tenacity-4.1.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/42/e7/1b5acde23073873a3f463ed4da538e7457113d1e2ff58256fc6bf18bc72b/tenacity-4.1.0.tar.gz"; sha256 = "9d800437c8495c78c54615d7f839725afd8858d7f8bb360ee03addb90039fe96"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."futures"
      self."monotonic"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/jd/tenacity";
        license = "License :: OSI Approved :: Apache Software License";
        description = "Retry code until it succeeeds";
      };
    };



    "vine" = python.mkDerivation {
      name = "vine-1.1.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/35/21/308904b027636f13c3970ed7caf2c53fca77fa160122ae3ac392d9eb6307/vine-1.1.3.tar.gz"; sha256 = "87b95da19249373430a8fafca36f1aecb7aa0f1cc78545877857afc46aea2441"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/celery/vine";
        license = licenses.bsdOriginal;
        description = "Promises, promises, promises.";
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



    "zope.interface" = python.mkDerivation {
      name = "zope.interface-4.4.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/90/1c/942298a4f5ef7db8c885ae687c59d397127f5a8cff7a473b0d7475a2c6e7/zope.interface-4.4.1.tar.gz"; sha256 = "350e3615d70a96678c3170eb5c96d4f72b8e7738861afbf030967d52c05722fe"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/zopefoundation/zope.interface";
        license = licenses.zpt21;
        description = "Interfaces for Python";
      };
    };
};
in fix' generated
