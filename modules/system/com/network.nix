{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.com.network;
in {
  options.augs.com.network.enable = mkEnableOption "enable the base network module";
  config = mkIf cfg.enable {
    networking = {
      hostName = lib.mkDefault config.var.host;
      firewall = {
        enable = lib.mkDefault true;
        allowedUDPPorts = lib.mkDefault [];
        allowedTCPPorts =
          if config.augs.metal.base.promtail.enable
          then lib.mkDefault [9002]
          else lib.mkDefault [];
      };
    };
  };
}
