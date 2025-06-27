{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.services.openrgb;
in {
  options.augs.services.openrgb.enable = mkEnableOption "enable openrgb";
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
