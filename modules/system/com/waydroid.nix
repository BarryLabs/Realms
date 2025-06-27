{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.com.waydroid;
in {
  options.augs.com.waydroid.enable = mkEnableOption "enable waydroid";
  config = mkIf cfg.enable {
    virtualisation = {
      waydroid = {
        enable = true;
      };
    };
  };
}
