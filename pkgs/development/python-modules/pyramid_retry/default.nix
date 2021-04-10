{ lib
, buildPythonPackage
, fetchPypi
, pyramid
, zope_interface
, setuptools
}:

buildPythonPackage rec {
  pname = "pyramid_retry";
  version = "2.1.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "baa8276ae68babad09e5f2f94efc4f7421f3b8fb526151df522052f8cd3ec0c9";
  };

  propagatedBuildInputs = [ pyramid zope_interface setuptools ];

  pythonImportsCheck = [ "pyramid_retry" ];

  meta = with lib; {
    description = "An execution policy for Pyramid that supports retrying requests";
    homepage = "https://github.com/Pylons/pyramid_retry";
    license = licenses.bsd0;
    maintainers = with maintainers; [ holgerpeters ];
  };
}
