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
        rev = "edb83decc2d5806265da5ce6bdebc72e7ae78871";
        sha256 = "1nyri71c6frp0cx369pydvs2b8h14lczgmx1nqrkdyzp3l6rza30";
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
    # There are about 10 000 options and we selected a subset to speedup error and try :/
    # xmlstarlet ed -N "x=http://docbook.org/ns/docbook"  -d 'x:appendix/x:variablelist/x:varlistentry[position()>100]' ${generatedSources}/options-db.xml > $out/generated/options-db.xml
    # At the end, we still need to format the xml file
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


}
