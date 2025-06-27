{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.services.syncthing.default;
in {
  options.augs.services.syncthing.default.enable = mkEnableOption "enable default syncthing";
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
