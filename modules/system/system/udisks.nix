{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.system.udisks;
in {
  options.augs.system.udisks.enable = mkEnableOption "enable udisks";
  config = mkIf cfg.enable {
    services = {
      udisks2 = {
        enable = true;
      };
    };
  };
}
