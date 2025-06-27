{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.mods.tools.btop;
in {
  options.mods.tools.btop.enable = mkEnableOption "enable btop";
  config = mkIf cfg.enable {
    programs = {
      btop = {
        enable = true;
        settings = {
          color_theme = "dracula";
          vim_keys = true;
          update_ms = 200;
          disks_filter = "";
          mem_graphs = true;
          proc_per_core = true;
        };
      };
    };
  };
}
