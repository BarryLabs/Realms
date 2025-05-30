{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.mods.cli.thefuck;
in {
  options.mods.cli.thefuck.enable = mkEnableOption "enable thefuck";
  config = mkIf cfg.enable {
    programs = {
      thefuck = {
        enable = true;
        enableZshIntegration = true;
      };
    };
  };
}
