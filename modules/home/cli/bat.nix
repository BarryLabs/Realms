{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.mods.cli.bat;
in {
  options.mods.cli.bat.enable = mkEnableOption "enable sane bat";
  config = mkIf cfg.enable {
    programs = {
      bat = {
        enable = true;
        extraPackages = with pkgs.bat-extras; [
          batdiff
          batman
          batgrep
          batwatch
          batpipe
          prettybat
        ];
        themes = {
          dracula = {
            src = pkgs.fetchFromGitHub {
              owner = "dracula";
              repo = "sublime";
              rev = "26c57ec282abcaa76e57e055f38432bd827ac34e";
              sha256 = "019hfl4zbn4vm4154hh3bwk6hm7bdxbr1hdww83nabxwjn99ndhv";
            };
            file = "Dracula.tmTheme";
          };
        };
      };
    };
  };
}
