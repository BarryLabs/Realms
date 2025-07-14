{
  config,
  lib,
  ...
}:
with lib;
let
  cfg = config.augs.com.network;
in
{
  options.augs.com.network.enable = mkEnableOption "enable the base network module";
  config = mkIf cfg.enable {
    networking = {
      hostName = config.var.host;
      firewall = {
        enable = true;
        allowedUDPPorts = [ ];
        allowedTCPPorts = [ ];
        # allowedTCPPorts =
        #   if config.augs.services.promtail.enable
        #   then [9002]
        #   else [];
      };
    };
  };
}
