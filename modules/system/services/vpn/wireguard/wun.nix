{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.vpn.wireguard.wun;
in {
  options.augs.vpn.wireguard.wun.enable = mkEnableOption "enable wireguard for wun";
  config = mkIf cfg.enable {
    networking.wg-quick.interfaces = {
      wg0 = {
        autostart = false;
        configFile = "/root/.config/wg-quick/us-ny-wg-301.conf";
        # dns = [];
        # address = [];
        # privateKeyFile = "";
        # peers = [
        #   {
        #     endpoint = "";
        #     publicKey = "";
        #     allowedIPs = [];
        #     presharedKeyFile = "";
        #     persistentKeepalive = 25;
        #   }
        # ];
      };
    };
  };
}
