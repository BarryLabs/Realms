{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.net.vpn.openvpn.mullvadUS;
in {
  options.augs.net.vpn.openvpn.mullvadUS.enable = mkEnableOption "enable openvpn configuration to mullvad servers";
  config = mkIf cfg.enable {
    services = {
      openvpn = {
        servers = {
          mullvadUS = {
            autoStart = false;
            config = ''
              config /root/.config/openvpn/mullvad_us_all.conf
            '';
          };
        };
      };
    };
  };
}
