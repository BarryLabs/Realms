{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.com.zsh;
in {
  options.augs.com.zsh.enable = mkEnableOption "enable zsh";
  config = mkIf cfg.enable {
    programs = {
      zsh = {
        enable = true;
      };
    };
  };
}
