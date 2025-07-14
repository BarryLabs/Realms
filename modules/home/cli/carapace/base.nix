{
  config,
  lib,
  ...
}:
with lib;
let
  cfg = config.mods.cli.carapace.base;
in
{
  options.mods.cli.carapace.base.enable = mkEnableOption "enable base carapace module";
  config = mkIf cfg.enable {
    programs = {
      carapace = {
        enable = true;
        enableNushellIntegration = true;
      };
    };
  };
}
