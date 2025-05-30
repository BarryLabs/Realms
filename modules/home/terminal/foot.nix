{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.mods.terminal.foot;
in {
  options.mods.terminal.foot.enable = mkEnableOption "enable foot";
  config = mkIf cfg.enable {
    programs = {
      foot = {
        enable = true;
        server = {
          enable = true;
        };
        settings = {
          main = {
            term = "xterm-256color";
            font = "JetBrainsMono:size=9";
            dpi-aware = "yes";
          };
          scrollback = {
            lines = "5000";
            multiplier = "4.0";
          };
          mouse = {
            hide-when-typing = "yes";
          };
          tweak = {
            max-shm-pool-size-mb = "1024";
          };
        };
      };
    };
  };
}
