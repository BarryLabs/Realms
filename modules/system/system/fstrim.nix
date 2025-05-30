{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.system.fstrim;
in {
  options.augs.system.fstrim.enable = mkEnableOption "enable fstrim";
  config = mkIf cfg.enable {
    services = {
      fstrim = {
        enable = true;
        interval = "weekly";
      };
    };
  };
}
