# We expose a lot of derivation in order to be able to provide caching
# and be able to export rst file to run locally some command such as
# db2rst, sphinx...

{ pkgs, sources, copySources, generatedSources }:
rec {
  db2rst = pkgs.stdenv.mkDerivation rec {
      name = "db2rst";
      src = pkgs.fetchFromGitHub {
        owner = "nlewo";
        repo = name;
        rev = "e9e3d0aa3d4c4ae383cdc33deb14d3e10fd19155";
        sha256 = "14yxjy7vzpm3qq2i4fvhknzkgw8simr1m7iv9rimliwan0hpm863";
      };
      buildInputs = [ (pkgs.python2.withPackages(p: [p.lxml])) ];
      installPhase = ''
        mkdir -p $out/bin
        cp db2rst.py $out/bin/db2rst
      '';
    };


  manualReSTGenerated = pkgs.runCommand "nixos-manual-rest-generated"
  {
    inherit sources;
    nativeBuildInputs = [ pkgs.xmlstarlet db2rst ];
  }
  ''
    mkdir -p $out/generated

    # For Dev mode
    # There are about 10 000 options and we selected a subset to speedup error and try :/
    # xmlstarlet ed -N "x=http://docbook.org/ns/docbook"  -d 'x:appendix/x:variablelist/x:varlistentry[position()>100]' ${generatedSources}/options-db.xml > $out/generated/options-db.xml

    # We still need to format the xml file in order to convert it properly:/
    xmlstarlet fo ${generatedSources}/options-db.xml > $out/generated/options-db.xml 
    db2rst $out/generated/options-db.xml > $out/generated/options-db.xml.rst
  '';

  manualReSTFiles = pkgs.runCommand "nixos-manual-rest"
  {
    inherit sources;
    nativeBuildInputs = [ db2rst pkgs.rsync ];
  }
  ''
    ${copySources}
    find ./ -name  "*.xml" \
      -not -name "manual.xml" \
      -not -name "options-db" \
      -exec bash -c "db2rst '{}' > '{}.rst'" \;

    rsync -av --include '**/' --include '*.xml' --exclude '*' ./ $out/
    rsync -av --include '**/' --include '*.rst' --exclude '*' ./ $out/
    cp ${./index.rst} $out/index.rst
    cp ${./conf.py} $out/conf.py
    cp -r ${manualReSTGenerated}/* $out/
  '';

  manualReSTHTML = pkgs.runCommand "nixos-manual-rest-html"
  {
    inherit sources;
    nativeBuildInputs = [(pkgs.python.withPackages(p: [p.sphinx]))];
  }
  ''
    sphinx-build -M html "${manualReSTFiles}" "_build"
    cp -r ./_build $out
  '';

  manpagesReST = pkgs.runCommand "nixos-manages-rest"
  {
    nativeBuildInputs = [(pkgs.python.withPackages(p: [p.sphinx]))];
  }
  ''
    cp ${./conf.py} ./conf.py
    cp ${./index.rst} ./index.rst
    cp ${./man-nixos-rebuild.rst} ./man-nixos-rebuild.rst

    sphinx-build -M man . "_build"
    cp -r ./_build $out
  '';

}
