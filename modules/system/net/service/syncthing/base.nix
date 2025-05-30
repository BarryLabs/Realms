{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.net.syncthing.base;
in {
  options.augs.net.syncthing.base.enable = mkEnableOption "enable base syncthing";
  config = mkIf cfg.enable {
    services = {
      syncthing = {
        enable = true;
        user = config.var.user;
        dataDir = "/home/${config.var.user}";
        configDir = "/home/${config.var.user}/.config/syncthing";
        settings = {};
      };
    };
  };
}
