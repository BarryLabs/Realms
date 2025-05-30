{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.virtualisation.virt-manager;
in {
  options.augs.virtualisation.virt-manager.enable = mkEnableOption "enable virt-manager";
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
