{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.net.service.loki.heimskringla;
in {
  options.augs.net.service.loki.heimskringla.enable = mkEnableOption "enable loki for heimskringla";
  config = mkIf cfg.enable {
    services = {
      loki = {
        enable = true;
        configFile = ../../../../../../.config/loki/loki.yaml;
      };
    };
  };
}
