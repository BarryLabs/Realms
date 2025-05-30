{pkgs, ...}: {
  home = {
    packages = [
      (import ./screenshot.nix {inherit pkgs;})
      (import ./rofi-launcher.nix {inherit pkgs;})
    ];
  };
}
