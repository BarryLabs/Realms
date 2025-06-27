{
  config,
  lib,
  ...
}:
with lib;
let
  cfg = config.mods.cli.zellij;
in
{
  options.mods.cli.zellij.enable = mkEnableOption "enable zellij";
  config = mkIf cfg.enable {
    programs = {
      zellij = {
        enable = true;
      };
    };
    home.file."zellij" = {
      recursive = true;
      source = ../../../.config/zellij;
      target = ".config/zellij/";
    };
  };
}
