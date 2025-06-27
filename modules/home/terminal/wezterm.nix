{
  config,
  lib,
  ...
}:
with lib;
let
  cfg = config.mods.terminal.wezterm;
in
{
  options.mods.terminal.wezterm.enable = mkEnableOption "enable sane wezterm";
  config = mkIf cfg.enable {
    programs = {
      wezterm = {
        enable = true;
        #extraConfig = '''';
      };
    };
  };
}
