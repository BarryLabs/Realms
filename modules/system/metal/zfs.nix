{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.metal.base.zfs;
in {
  options.augs.metal.base.zfs.enable = mkEnableOption "enable base zfs module";
  config = mkIf cfg.enable {
    boot = {
      supportedFilesystems = ["zfs"];
      zfs = {
        forceImportRoot =
          if config.networking.hostName == "asgard"
          then false
          else true;
        extraPools = (
          if config.networking.hostName == "asgard"
          then ["void"]
          else []
        );
      };
    };
    services = {
      zfs = {
        autoScrub = {
          enable = true;
          interval = "monthly";
          pools =
            [
            ]
            ++ (
              if config.networking.hostName == "asgard"
              then ["void"]
              else []
            );
          randomizedDelaySec = "12h";
        };
        autoSnapshot = {
          enable = true;
          flags = "-k -p --utc";
          frequent = 4;
          hourly = 24;
          daily = 7;
          weekly = 4;
          monthly = 12;
        };
        trim = {
          enable = true;
          interval = "weekly";
          randomizedDelaySec = "2h";
        };
      };
    };
  };
}
