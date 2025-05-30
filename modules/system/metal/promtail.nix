{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.augs.metal.base.promtail;
in {
  options.augs.metal.base.promtail.enable = mkEnableOption "enable the base promtail module";
  config = mkIf cfg.enable {
    systemd = {
      services = {
        promtail = {
          description = "Promtail for Loki";
          wantedBy = ["multi-user.target"];
          serviceConfig = {
            ExecStart = ''
              ${pkgs.grafana-loki}/bin/promtail --config.file ${../../../.config/promtail/${config.var.host}.yaml}
            '';
          };
        };
      };
    };
  };
}
