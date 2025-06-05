{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.com.pipewire;
in {
  options.augs.com.pipewire.enable = mkEnableOption "enable pipewire";
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
