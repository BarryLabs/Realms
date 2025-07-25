{
  config,
  lib,
  ...
}:
with lib;
let
  cfg = config.mods.cli.eza.base;
in
{
  options.mods.cli.eza.base.enable = mkEnableOption "enable base eza module";
  config = mkIf cfg.enable {
    programs = {
      eza = {
        enable = true;
        enableZshIntegration = true;
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
