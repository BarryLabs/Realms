{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.com.virt-manager;
in {
  options.augs.com.virt-manager.enable = mkEnableOption "enable virt-manager";
  config = mkIf cfg.enable {
    programs = {
      virt-manager = {
        enable = true;
      };
    };
    virtualisation = {
      libvirtd = {
        enable = true;
      };
    };
  };
}
