{ stdenv }:
stdenv.mkDerivation {
  name = "wallpapers";
  src = "../../wallpapers";
  installPhase = ''
    mkdir -p $out/share/wallpapers
    cp -r $src/* $out/share/wallpapers
  '';
}
