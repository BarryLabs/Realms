{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.programs.zsh;
in {
  options.augs.programs.zsh.enable = mkEnableOption "enable zsh";
  config = mkIf cfg.enable {
    programs = {
      zsh = {
        enable = true;
      };
    };
  };
}
