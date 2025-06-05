{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.com.k3s;
in {
  options.augs.com.k3s.enable = mkEnableOption "enable k3s";
  config = mkIf cfg.enable {
    networking.firewall = {
      allowedTCPPorts = [6443];
      allowedUDPPorts = [8472];
    };
    services.k3s = {
      enable = true;
      role = "server";
      extraFlags = toString [
        # "--debug"
      ];
    };
  };
}
