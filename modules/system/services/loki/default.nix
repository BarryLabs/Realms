{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.services.loki;
in {
  options.augs.services.loki.enable = mkEnableOption "enable loki for heimskringla";
  config = mkIf cfg.enable {
    services = {
      loki = {
        enable = true;
        configFile = ../../../.config/loki/loki.yaml;
      };
    };
  };
}
