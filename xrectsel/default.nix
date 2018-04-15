{ stdenv, fetchgit, autoconf, automake, libX11 }:
stdenv.mkDerivation rec {
  name = "xrectsel";

  src = fetchgit {
    url = "https://github.com/lolilolicon/xrectsel";
    rev = "8ca4c63f2305f834baa63cf92af2da7daa859c0b";
    sha256 = "1j46ww24dvndwrzmdl5gzqzbnwdadzf3v6jf9l7h5acil86jwb34";
  };

  buildInputs = [
    autoconf
    automake
    libX11
  ];

  buildPhase = ''
    ./bootstrap
    ./configure --prefix=$out
    make
  '';

  installPhase = ''
    make install
  '';

  meta = {
    homepage = "https://github.com/lolilolicon/xrectsel";
    description = "Select rectangles in X";
    license = stdenv.lib.licenses.gpl3;
  };
}
