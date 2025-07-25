{
  config,
  lib,
  ...
}:
with lib;
let
  cfg = config.mods.cli.zellij.base;
in
{
  options.mods.cli.zellij.base.enable = mkEnableOption "enable base zellij module";
  config = mkIf cfg.enable {
    programs = {
      zellij = {
        enable = true;
      };
    };
    home.file."zellij" = {
      recursive = true;
      source = ../../../../.config/zellij;
      target = ".config/zellij/";
    };
  };
}
