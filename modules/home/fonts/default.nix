{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.mods.fonts.default;
in {
  options.mods.fonts.default.enable = mkEnableOption "enable default fonts";
  config = mkIf cfg.enable {
    fonts = {
      fontconfig = {
        enable = true;
        defaultFonts = {
          serif = ["Montserrat"];
          sansSerif = ["Montserrat"];
          emoji = ["openmoji-color" "noto-fonts-emoji"];
          monospace = ["Source Code Pro" "JetBrainsMono"];
        };
      };
    };
  };
}
