{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.virtualisation.waydroid;
in {
  options.augs.virtualisation.waydroid.enable = mkEnableOption "enable waydroid";
  config = mkIf cfg.enable {
    virtualisation = {
      waydroid = {
        enable = true;
      };
    };
  };
}
