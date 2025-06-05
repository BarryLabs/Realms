{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    go
    gopls
    gotools
  ];
  GOPATH = "$HOME/Projects/Go";
}
