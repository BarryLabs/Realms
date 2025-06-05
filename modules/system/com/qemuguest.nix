{
  config,
  lib,
  modulesPath,
  ...
}:
with lib; let
  cfg = config.augs.com.qemuguest;
in {
  imports = [
    (modulesPath + "/profiles/qemu-guest.nix")
  ];
  options.augs.com.qemuguest.enable = mkEnableOption "enable qemuguest";
  config = mkIf cfg.enable {
    services = {
      qemuGuest = {
        enable = true;
      };
    };
  };
}
