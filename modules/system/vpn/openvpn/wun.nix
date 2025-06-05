{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.vpn.openvpn.wun;
in {
  options.augs.vpn.openvpn.wun.enable = mkEnableOption "enable openvpn for wun";
  config = mkIf cfg.enable {
    services = {
      openvpn = {
        servers = {
          mullvadUS = {
            autoStart = false;
            config = ''
              config /root/.config/openvpn/wun.conf
            '';
          };
        };
      };
    };
  };
}
