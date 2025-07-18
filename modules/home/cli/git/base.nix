{
  config,
  lib,
  ...
}:
with lib;
let
  cfg = config.mods.cli.git.base;
in
{
  options.mods.cli.git.base.enable = mkEnableOption "enable base git module";
  config = mkIf cfg.enable {
    programs = {
      git = {
        enable = true;
        userName = "BarryLabs";
        userEmail = "wave.carton247@aleeas.com";
        extraConfig = {
          core = {
            editor = "nvim";
            init.defaultBranch = "main";
          };
        };
      };
    };
  };
}
