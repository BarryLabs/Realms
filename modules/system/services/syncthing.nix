{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.services.syncthing;
in {
  options.augs.services.syncthing.enable = mkEnableOption "enable base syncthing";
  config = mkIf cfg.enable {
    systemd = {
      services = {
        syncthing = {
          environment = {
            STNODEFAULTFOLDER = "true";
          };
        };
      };
    };
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
