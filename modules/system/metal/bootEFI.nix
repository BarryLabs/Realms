{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.metal.base.bootEFI;
in {
  options.augs.metal.base.bootEFI.enable = mkEnableOption "enable the base bootEFI module";
  config = mkIf cfg.enable {
    boot = {
      loader = {
        systemd-boot = {
          enable = true;
        };
        efi = {
          canTouchEfiVariables = true;
        };
      };
    };
  };
}
