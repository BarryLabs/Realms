{
  config,
  lib,
  ...
}:
with lib;
let
  cfg = config.mods.cli.carapace;
in
{
  options.mods.cli.carapace.enable = mkEnableOption "enable carapace";
  config = mkIf cfg.enable {
    programs = {
      carapace = {
        enable = true;
        enableNushellIntegration = true;
      };
    };
  };
}
