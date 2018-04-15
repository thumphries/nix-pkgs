{ stdenv, fetchgit, python36 }:
stdenv.mkDerivation rec {
  name = "acpilight";

  src = fetchgit {
    url = "https://github.com/wavexx/acpilight";
    rev = "707a593e23238a00da8015875d2c74da0a249496";
    sha256 = "1fszya73zgr55dxajd8v0yif96w49r40rrpnfcsi6ac8m903g1wx";
  };

  pyenv = python36.withPackages (pythonPackages: with pythonPackages; [
    argparse
  ]);


  buildInputs = [ pyenv ];

  installPhase = ''
    mkdir -p $out/etc/udev/rules.d
    cp 90-backlight.rules $out/etc/udev/rules.d/90-backlight.rules
    mkdir -p $out/bin
    cp xbacklight $out/bin/xbacklight
    gzip xbacklight.1
    mkdir -p $out/share/man/man1
    cp xbacklight.1.gz $out/share/man/man1/xbacklight.1.gz
  '';

  meta = {
    homepage = "https://github.com/wavexx/acpilight";
    description = "ACPI backlight control";
    license = stdenv.lib.licenses.gpl3;
  };
}
