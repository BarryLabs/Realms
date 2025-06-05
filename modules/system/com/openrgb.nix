{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.com.openrgb;
in {
  options.augs.com.openrgb.enable = mkEnableOption "enable openrgb";
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
