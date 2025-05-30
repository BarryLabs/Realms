{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.metal.base.sops;
in {
  options.augs.metal.base.sops.enable = mkEnableOption "enable the base sops module";
  config = mkIf cfg.enable {
    sops = {
      age = {
        keyFile = config.var.ageFile;
      };
      defaultSopsFormat = "yaml";
      defaultSopsFile = ../../../secrets/${config.var.host}.yaml;
    };
  };
}
