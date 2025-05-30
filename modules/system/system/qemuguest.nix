{
  config,
  lib,
  modulesPath,
  ...
}:
with lib; let
  cfg = config.augs.system.qemuguest;
in {
  imports = [
    (modulesPath + "/profiles/qemu-guest.nix")
  ];
  options.augs.system.qemuguest.enable = mkEnableOption "enable qemuguest";
  config = mkIf cfg.enable {
    services = {
      qemuGuest = {
        enable = true;
      };
    };
  };
}
