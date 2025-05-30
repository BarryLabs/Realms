{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.programs.hyprland;
in {
  options.augs.programs.hyprland.enable = mkEnableOption "enable hyprland system program";
  config = mkIf cfg.enable {
    programs = {
      hyprland = {
        enable = true;
      };
    };
  };
}
