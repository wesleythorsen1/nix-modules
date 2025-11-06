{ pkgs }:

pkgs.stdenv.mkDerivation {
  pname = "pbfmt";
  version = "0.1.0";

  src = ./pbfmt;
  dontUnpack = true;
  strictDeps = true;

  nativeBuildInputs = [
    pkgs.getoptions
  ];

  buildPhase = ''
    cp "$src" pbfmt
    chmod 777 pbfmt
    patchShebangs pbfmt
    ${pkgs.getoptions}/bin/gengetoptions embed --overwrite pbfmt
  '';

  installPhase = ''
    install -D -m 0755 pbfmt $out/bin/pbfmt
  '';

  meta = {
    description = "Pasteboard formatter: quote clipboard lines, etc.";
    platforms = pkgs.lib.platforms.darwin; # relies on pbpaste/pbcopy from macOS
    license = pkgs.lib.licenses.unlicense; # getoptions is CC0; your script can be whatever you choose
  };
}
