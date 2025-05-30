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
          eDP-1 = {
            path = "/etc/nixos/.config/wallpapers/treepond_colors.png";
            apply-shadow = true;
          };
        };
      };
    };
  };
}
