{
  config,
  lib,
  ...
}:
with lib;
let
  cfg = config.mods.cli.eza;
in
{
  options.mods.cli.eza.enable = mkEnableOption "enable eza";
  config = mkIf cfg.enable {
    programs = {
      eza = {
        enable = true;
        enableNushellIntegration = true;
        #enableZshIntegration = true;
        colors = "auto";
        icons = "auto";
        extraOptions = [
          "--header"
          "--group-directories-first"
        ];
      };
    };
  };
}
