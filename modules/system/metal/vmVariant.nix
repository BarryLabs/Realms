{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.metal.base.vmVariant;
in {
  options.augs.metal.base.vmVariant.enable = mkEnableOption "enable the base vmVariant module";
  config = mkIf cfg.enable {
    virtualisation = {
      vmVariant = {
        virtualisation = {
          cores = 2;
          graphics = false;
          memorySize = 2048;
        };
      };
    };
  };
}
