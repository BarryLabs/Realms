{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.system.openrgb;
in {
  options.augs.system.openrgb.enable = mkEnableOption "enable openrgb";
  config = mkIf cfg.enable {
    services = {
      hardware = {
        openrgb = {
          enable = true;
        };
      };
    };
  };
}
