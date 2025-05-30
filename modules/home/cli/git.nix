{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.mods.cli.git;
in {
  options.mods.cli.git.enable = mkEnableOption "enable chandler's git config";
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
