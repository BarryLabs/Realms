{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.metal.base.network;
in {
  options.augs.metal.base.network.enable = mkEnableOption "enable the base network module";
  config = mkIf cfg.enable {
    networking = {
      hostName = config.var.host;
      firewall = {
        enable = true;
        allowedUDPPorts = [];
        allowedTCPPorts =
          if config.augs.metal.base.promtail.enable
          then [9002]
          else [];
      };
    };
  };
}
