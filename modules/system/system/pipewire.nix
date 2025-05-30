{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.system.pipewire;
in {
  options.augs.system.pipewire.enable = mkEnableOption "enable pipewire";
  config = mkIf cfg.enable {
    services = {
      pipewire = {
        enable = true;
        alsa = {
          enable = true;
          support32Bit = true;
        };
        pulse = {
          enable = true;
        };
        wireplumber = {
          enable = true;
        };
      };
    };
  };
}
