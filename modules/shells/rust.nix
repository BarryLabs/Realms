{
  pkgs ? import <nixpkgs> { },
}:
pkgs.mkShell {
  RUST_BACKTRACE = "full";
  buildInputs = with pkgs; [
    cargo
    clippy
    rustc
    rustfmt
    rust-analyzer
    pkg-config
    openssl
  ];
}
