{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.metal.base.cpu;
in {
  options.augs.metal.base.cpu.enable = mkEnableOption "enable the base cpu module";
  config = mkIf cfg.enable {
    hardware = {
      cpu = {
        # amd = {
        #   updateMicrocode =
        #     if config.networking.hostName == "mini-iso"
        #     then lib.mkDefault config.hardware.enableRedistributableFirmware
        #     else false;
        # };
        intel = {
          updateMicrocode =
            if config.networking.hostName == "mini-iso"
            then lib.mkDefault config.hardware.enableRedistributableFirmware
            else false;
        };
      };
    };
  };
}
