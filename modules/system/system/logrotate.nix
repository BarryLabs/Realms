{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.system.logrotate;
in {
  options.augs.system.logrotate.enable = mkEnableOption "enable logrotate";
  config = mkIf cfg.enable {
    services = {
      logrotate = {
        checkConfig = false;
      };
    };
  };
}
