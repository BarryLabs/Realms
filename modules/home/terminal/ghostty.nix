{
  config,
  lib,
  ...
}:
with lib;
let
  cfg = config.mods.terminal.ghostty;
in
{
  options.mods.terminal.ghostty.enable = mkEnableOption "enable sane ghostty";
  config = mkIf cfg.enable {
    programs = {
      ghostty = {
        enable = true;
        installBatSyntax = true;
        installVimSyntax = true;
        settings = {
          theme = "catppuccin-mocha";
          font-size = 10;
          mouse-hide-while-typing = true;
          keybind = [
            "ctrl+z=close_surface"
            "ctrl+d=new_split:right"
          ];
        };
      };
    };
  };
}
