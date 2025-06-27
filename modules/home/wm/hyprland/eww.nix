{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.mods.wm.wayland.eww;
in {
  options.mods.wm.wayland.eww.enable = mkEnableOption "enable eww";
  config = mkIf cfg.enable {
    programs = {
      eww = {
        enable = true;
        enableZshIntegration = true;
        configDir = ../../../../.config/eww;
      };
    };
  };
}
