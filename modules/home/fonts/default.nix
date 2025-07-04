{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.mods.fonts.default;
in {
  options.mods.fonts.default.enable = mkEnableOption "enable default fonts";
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      noto-fonts
      noto-fonts-emoji
      openmoji-color
      source-code-pro
    ];
    fonts = {
      fontconfig = {
        enable = true;
        defaultFonts = {
          serif = ["source-code-pro"];
          sansSerif = ["source-code-pro"];
          emoji = ["openmoji-color" "noto-fonts-emoji"];
          monospace = ["source-code-pro"];
        };
      };
    };
  };
}
