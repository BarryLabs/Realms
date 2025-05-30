{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.mods.cli.fzf;
in {
  options.mods.cli.fzf.enable = mkEnableOption "enable fuzzy finder";
  config = mkIf cfg.enable {
    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
