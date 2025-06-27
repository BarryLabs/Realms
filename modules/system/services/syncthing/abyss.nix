{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.sync.abyss;
in {
  options.augs.sync.abyss.enable = mkEnableOption "enable syncthing for abyss";
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
        settings = {
          devices = {
            "Void" = {id = "WA3WM4H-B4ASNDJ-JSL32QE-FJB3BXI-SNSWLA6-ESXJU5U-ZNWZ4JG-ZD2GXQA";};
          };
          folders = {
            "Notes" = {
              path = "/home/${config.var.user}/Documents/Notes";
              devices = ["Void"];
            };
            "Vault" = {
              path = "/home/${config.var.user}/Documents/Vault";
              devices = ["Void"];
            };
          };
        };
      };
    };
  };
}
