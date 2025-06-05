{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.services.arr;
in {
  options.augs.services.arr.enable = mkEnableOption "enable media services for aegir";
  config = mkIf cfg.enable {
    services = {
      jellyseerr = {
        enable = true;
        openFirewall = true;
      };
      jellyfin = {
        enable = true;
        openFirewall = true;
        dataDir = "/srv/Modules/Jellyfin/Data";
        cacheDir = "/srv/Modules/Jellyfin/Cache";
      };
      prowlarr = {
        enable = true;
        openFirewall = true;
      };
      radarr = {
        enable = true;
        openFirewall = true;
        dataDir = "/srv/Modules/Radarr/Data";
      };
      sonarr = {
        enable = true;
        openFirewall = true;
        dataDir = "/srv/Modules/Sonarr/Data";
      };
      lidarr = {
        enable = true;
        openFirewall = true;
        dataDir = "/srv/Modules/Lidarr/Data";
      };
      readarr = {
        enable = true;
        openFirewall = true;
        dataDir = "/srv/Modules/Readarr/Data";
      };
    };
  };
}
