{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.mods.cli.tealdeer;
in {
  options.mods.cli.tealdeer.enable = mkEnableOption "enable tealdeer";
  config = mkIf cfg.enable {
    programs = {
      tealdeer = {
        enable = true;
        settings = {
          updates = {
            auto_update = true;
            auto_update_interval_hours = 12;
          };
          display = {
            use_pager = true;
          };
        };
      };
    };
  };
}
