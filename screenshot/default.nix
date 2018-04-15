{ stdenv, symlinkJoin, writeShellScriptBin, imagemagick, scrot, xrectsel }:
let
  script = writeShellScriptBin "screenshot" ''
    set -euo pipefail
    RECT=$(${xrectsel}/bin/xrectsel)
    ${scrot}/bin/scrot -e "${imagemagick}/bin/convert -crop \"$RECT\" \$f \$f"
  '';
in
  symlinkJoin rec {
    version = "0.1";
    name = "screenshot";
    paths = [ script ];
    meta = {
      description = "X11 screenshot with selection";
      license = stdenv.lib.licenses.bsd3;
    };
  }
