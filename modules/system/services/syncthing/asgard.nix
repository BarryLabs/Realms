{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.sync.asgard;
in {
  options.augs.sync.asgard.enable = mkEnableOption "enable syncthing for asgard";
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
        openDefaultPorts = true;
        overrideDevices = true;
        overrideFolders = true;
        systemService = true;
        guiAddress = "0.0.0.0:8384";
        settings = {
          gui = {
            theme = "black";
            user = "Void";
            password = "sjezGgz1QA4MWjAakZHmiJYwljzOHQfaMIQhx5qJr5HmrgBEEtYcV39mOipsQbcw";
          };
          folders = {
            "Notes" = {
              enable = true;
              id = "Notes";
              label = "Notes";
              path = "${config.services.syncthing.dataDir}/Notes";
              copyOwnershipFromParent = true;
              type = "sendreceive";
              versioning = {
                type = "trashcan";
                params = {
                  cleanoutDays = "90";
                };
              };
              "GameshareLite" = {
                enable = true;
                id = "GameshareLite";
                label = "GameshareLite";
                path = "${config.services.syncthing.dataDir}/GameshareLite";
                copyOwnershipFromParent = true;
                type = "sendreceive";
                versioning = {
                  type = "trashcan";
                  params = {
                    cleanoutDays = "14";
                  };
                };
              };
              "Vault" = {
                enable = true;
                id = "Vault";
                label = "Vault";
                path = "${config.services.syncthing.dataDir}/Vault";
                copyOwnershipFromParent = true;
                type = "sendreceive";
                versioning = {
                  type = "trashcan";
                  params = {
                    cleanoutDays = "90";
                  };
                };
              };
            };
          };
          options = {
            urAccepted = -1;
            localAnnounceEnabled = true;
          };
        };
      };
    };
  };
}
