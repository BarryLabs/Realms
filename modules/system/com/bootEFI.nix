{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.com.bootEFI;
in {
  options.augs.com.bootEFI.enable = mkEnableOption "enable the base bootEFI module";
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
