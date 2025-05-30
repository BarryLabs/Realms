{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.mods.tools.podman;
in {
  options.mods.tools.podman.enable = mkEnableOption "enable podman";
  config = mkIf cfg.enable {
    services = {
      podman = {
        enable = true;
        autoUpdate = {
          enable = true;
          onCalendar = "Sun *-*-* 00:00";
        };
        settings = {
          registries = {
            search = [
              "quay.io"
              "docker.io"
            ];
          };
        };
      };
    };
  };
}
