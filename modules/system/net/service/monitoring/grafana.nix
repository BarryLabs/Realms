{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.net.service.grafana.heimskringla;
in {
  options.augs.net.service.grafana.heimskringla.enable = mkEnableOption "enable grafana for heimskringla";
  config = mkIf cfg.enable {
    services = {
      grafana = {
        enable = true;
        settings = {
          server = {
            http_addr = "0.0.0.0";
            http_port = 3000;
            enable_gzip = true;
          };
        };
      };
    };
  };
}
