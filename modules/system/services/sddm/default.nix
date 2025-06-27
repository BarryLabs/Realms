{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.augs.services.sddm;
in {
  options.augs.services.sddm.enable = mkEnableOption "enable sddm";
  config = mkIf cfg.enable {
    services = {
      displayManager = {
        sddm = {
          enable = true;
          package = pkgs.kdePackages.sddm;
          wayland = {
            enable = true;
            compositor = "weston";
          };
          theme = "catppuccin-mocha";
        };
      };
    };
  };
}
