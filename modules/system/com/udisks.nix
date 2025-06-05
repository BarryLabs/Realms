{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.com.udisks;
in {
  options.augs.com.udisks.enable = mkEnableOption "enable udisks";
  config = mkIf cfg.enable {
    services = {
      udisks2 = {
        enable = true;
      };
    };
  };
}
