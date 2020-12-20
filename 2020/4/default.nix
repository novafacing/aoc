{ mkDerivation, base, containers, split, stdenv }:
mkDerivation {
  pname = "x41";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base containers split ];
  license = stdenv.lib.licenses.mit;
}
