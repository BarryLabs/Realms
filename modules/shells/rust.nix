{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    cargo
    clippy
    rustc
    rustfmt
    rust-analyzer
    pkg-config
    openssl
  ];
  RUST_BACKTRACE = "full";
}
