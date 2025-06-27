{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  GOPATH = "$HOME/Projects/Go";
  buildInputs = with pkgs; [
    go
    gopls
    gotools
  ];
}
