{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.com.bluetooth;
in {
  options.augs.com.bluetooth.enable = mkEnableOption "enable base bluetooth module";
  config = mkIf cfg.enable {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };
}
