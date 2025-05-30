{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.augs.metal.base.environment;
in {
  options.augs.metal.base.environment.enable = mkEnableOption "enable the base environment module";
  config = mkIf cfg.enable {
    environment = {
      systemPackages = with pkgs; [
        git
        htop
      ];
    };
  };
}
