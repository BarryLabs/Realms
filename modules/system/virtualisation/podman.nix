{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.virtualisation.podman;
in {
  options.augs.virtualisation.podman.enable = mkEnableOption "enable podman";
  config = mkIf cfg.enable {
    virtualisation = {
      podman = {
        enable = true;
        dockerCompat = true;
        autoPrune = {
          enable = true;
          dates = "weekly";
          flags = [
            "--all"
          ];
        };
        defaultNetwork = {
          settings = {
            dns_enabled = true;
          };
        };
      };
    };
  };
}
