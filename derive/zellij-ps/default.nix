{
  stdenv,
  lib,
  makeWrapper,
  zsh,
  fd,
  fzf,
  zellij,
}:
stdenv.mkDerivation {
  pname = "zellij-ps";
  version = "0.1.0";
  src = builtins.path [./zellij-ps.zsh];
  buildInputs = [];
  nativeBuildInputs = [makeWrapper];
  installPhase = ''
    mkdir -p $out/bin
    cp zellij-ps.zsh $out/bin/zellij-ps
    wrapProgram $out/bin/zellij-ps \
      --prefix PATH : ${lib.makeBinPath [zsh fd fzf zellij]}
  '';
  meta = with lib; {
    description = "A small project script for zellij";
    homepage = "https://code.m3tam3re.com/m3tam3re/helper-scripts";
    license = licenses.mit;
    maintainers = with maintainers; [m3tam3re];
    platforms = platforms.unix;
  };
}
