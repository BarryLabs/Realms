{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.com.bootGRUB;
in {
  options.augs.com.bootGRUB.enable = mkEnableOption "enable the base bootGRUB module";
  config = mkIf cfg.enable {
    boot = {
      loader = {
        grub = {
          enable = true;
          useOSProber = true;
        };
      };
    };
  };
}
