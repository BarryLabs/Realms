{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.mods.cli.cava;
in {
  options.mods.cli.cava.enable = mkEnableOption "enable cava";
  config = mkIf cfg.enable {
    programs = {
      cava = {
        enable = true;
        settings = {
          general = {
            framerate = 60;
          };
          smoothing.noise_reduction = 88;
          color = {
            background = "'#111111'";
            foreground = "'#33ffff'";
          };
        };
      };
    };
  };
}
