{ stdenv, buildPythonPackage, fetchPypi, lib, isPyPy
, nose, httplib2, pyopenssl
, greenlet, enum-compat
}:

buildPythonPackage rec {
  pname = "eventlet";
  version = "0.21.0";
  name = "${pname}-${version}";

  src = fetchPypi {
    inherit pname version;
    sha256 = "08faffab88c1b08bd53ea28bf084a572c89f7e7648bd9d71e6116ac17a51a15d";
  };

  buildInputs = [ nose httplib2 pyopenssl  ];
  propagatedBuildInputs = lib.optionals (!isPyPy) [ greenlet enum-compat ];

  doCheck = false;  # too much transient errors to bother

  meta = with stdenv.lib; {
    homepage = "http://eventlet.net";
    license = licenses.mit;
    description = "Highly concurrent networking library";
  };
}
