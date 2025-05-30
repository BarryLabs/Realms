{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.metal.base.bootGRUB;
in {
  options.augs.metal.base.bootGRUB.enable = mkEnableOption "enable the base bootGRUB module";
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
