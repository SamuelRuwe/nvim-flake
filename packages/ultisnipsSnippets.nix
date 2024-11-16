{ pkgs }:
pkgs.stdenv.mkDerivation {
  name = "ultrisnipsSnippets";
  src = ../ultisnips;
  installPhase = ''
    mkdir -p $out/
    cp ./*.snippets $out/
  '';
}
