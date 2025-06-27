{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.com.logrotate;
in {
  options.augs.com.logrotate.enable = mkEnableOption "disable logrotate";
  config = mkIf cfg.enable {
    services = {
      logrotate = {
        checkConfig = false;
      };
    };
  };
}
