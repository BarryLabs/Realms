{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.augs.com.environment;
in {
  options.augs.com.environment.enable = mkEnableOption "enable the base environment module";
  config = mkIf cfg.enable {
    environment = {
      systemPackages = with pkgs; [
        git
        htop
      ];
    };
  };
}
