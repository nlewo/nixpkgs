{ qtSubmodule, qtquickcontrols, qtlocation, qtwebchannel

, xlibs, libXcursor, libXScrnSaver, libXrandr, libXtst
, fontconfig, freetype, harfbuzz, icu, dbus
, zlib, libjpeg, libpng, libtiff
, alsaLib
, libcap
, pciutils

, bison, flex, git, which, gperf
, coreutils
, pkgconfig, python2

, stdenv # lib.optional, needsPax
}:

qtSubmodule {
  name = "qtwebengine";
  qtInputs = [ qtquickcontrols qtlocation qtwebchannel ];
  buildInputs = [ bison flex git which gperf ];
  nativeBuildInputs = [ pkgconfig python2 coreutils ];
  doCheck = true;

  enableParallelBuilding = true;

  preConfigure = ''
    export MAKEFLAGS=-j$NIX_BUILD_CORES
    substituteInPlace ./src/3rdparty/chromium/build/common.gypi \
      --replace /bin/echo ${coreutils}/bin/echo
    substituteInPlace ./src/3rdparty/chromium/v8/gypfiles/toolchain.gypi \
      --replace /bin/echo ${coreutils}/bin/echo
    substituteInPlace ./src/3rdparty/chromium/v8/gypfiles/standalone.gypi \
      --replace /bin/echo ${coreutils}/bin/echo

    # fix default SSL bundle location
    sed -i -e 's,/cert.pem,/certs/ca-bundle.crt,' src/3rdparty/chromium/third_party/boringssl/src/crypto/x509/x509_def.c

    configureFlags+="\
        -plugindir $out/lib/qt5/plugins \
        -importdir $out/lib/qt5/imports \
        -qmldir $out/lib/qt5/qml \
        -docdir $out/share/doc/qt5"
  '';
  propagatedBuildInputs = [
    dbus zlib alsaLib

    # Image formats
    libjpeg libpng libtiff

    # Text rendering
    fontconfig freetype harfbuzz icu

    # X11 libs
    xlibs.xrandr libXScrnSaver libXcursor libXrandr xlibs.libpciaccess libXtst
    xlibs.libXcomposite

    libcap
    pciutils
  ];
  patches = stdenv.lib.optional stdenv.needsPax ./qtwebengine-paxmark-mksnapshot.patch;
  postInstall = ''
    cat > $out/libexec/qt.conf <<EOF
    [Paths]
    Prefix = ..
    EOF

    paxmark m $out/libexec/QtWebEngineProcess
  '';
}
