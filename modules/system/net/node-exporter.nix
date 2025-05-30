{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.net.node-exporter;
in {
  options.augs.net.node-exporter.enable = mkEnableOption "enable prometheus node-exporter";
  config = mkIf cfg.enable {
    services = {
      prometheus = {
        exporters = {
          node = {
            enable = true;
            port = 9002;
            openFirewall = true;
            enabledCollectors = ["systemd"];
          };
        };
      };
    };
  };
}
