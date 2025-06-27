{
  config,
  lib,
  ...
}:
with lib;
let
  cfg = config.mods.cli.zoxide;
in
{
  options.mods.cli.zoxide.enable = mkEnableOption "enable zoxide";
  config = mkIf cfg.enable {
    programs = {
      zoxide = {
        enable = true;
        enableNushellIntegration = true;
        #enableZshIntegration = true;
      };
    };
  };
}
