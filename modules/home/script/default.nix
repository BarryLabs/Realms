{pkgs, ...}: {
  home = {
    packages = [
      (import ./emoji.nix {inherit pkgs;})
      (import ./screenshot.nix {inherit pkgs;})
      (import ./rofi-launcher.nix {inherit pkgs;})
    ];
  };
}
