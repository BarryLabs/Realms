{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.com.sops;
in {
  options.augs.com.sops.enable = mkEnableOption "enable the base sops module";
  config = mkIf cfg.enable {
    sops = {
      age = {
        keyFile = config.var.ageFile;
      };
      defaultSopsFormat = lib.mkDefault "yaml";
      defaultSopsFile = lib.mkDefault ../../../secrets/${config.var.host}.yaml;
    };
  };
}
