{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.net.service.prometheus.heimskringla;
in {
  options.augs.net.service.prometheus.heimskringla.enable = mkEnableOption "enable prometheus for heimskringla";
  config = mkIf cfg.enable {
    services = {
      prometheus = {
        enable = true;
        port = 9001;
        scrapeConfigs = [
          {
            job_name = "Homelab Node Collection";
            static_configs = [
              {
                targets = [
                  "127.0.0.1:${toString config.services.prometheus.exporters.node.port}"
                  "192.168.1.235:${toString config.services.prometheus.exporters.node.port}"
                  "192.168.1.245:${toString config.services.prometheus.exporters.node.port}"
                  "192.168.30.5:${toString config.services.prometheus.exporters.node.port}"
                  "192.168.40.5:${toString config.services.prometheus.exporters.node.port}"
                ];
              }
            ];
          }
        ];
      };
    };
  };
}
