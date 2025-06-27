{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.mods.wm.wayland.wpaperd;
in {
  options.mods.wm.wayland.wpaperd.enable = mkEnableOption "enable wpaperd";
  config = mkIf cfg.enable {
    services = {
      wpaperd = {
        enable = true;
        settings = {
          HDMI-A-1 = {
            path = "/etc/nixos/.config/wallpapers/treepond_colors.png";
            apply-shadow = true;
          };
          HDMI-A-2 = {
            path = "/etc/nixos/.config/wallpapers/cat_wall.jpeg";
            apply-shadow = true;
          };
        };
      };
    };
  };
}
