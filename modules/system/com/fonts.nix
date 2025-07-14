{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.augs.com.fonts;
in
{
  options.augs.com.fonts.enable = mkEnableOption "enable fonts";
  config = mkIf cfg.enable {
    fonts = {
      enableDefaultPackages = true;
      packages = with pkgs; [
        jetbrains-mono
        source-code-pro
        font-awesome
        openmoji-color
        noto-fonts-emoji
      ];
      fontconfig = {
        enable = true;
        useEmbeddedBitmaps = true;
      };
    };
  };
}
