{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.augs.com.kernelDaily;
in
{
  options.augs.com.kernelDaily.enable = mkEnableOption "enable daily kernel";
  config = mkIf cfg.enable {
    boot = {
      kernelPackages = pkgs.linuxPackages_zen;
      kernelModules = [
        "kvm-amd"
        "snd_aloop"
        "v4l2loopback"
      ];
      extraModulePackages = [
        config.boot.kernelPackages.v4l2loopback
      ];
      initrd = {
        availableKernelModules = [
          "nvme"
          "xhci_pci"
          "ahci"
          "usb_storage"
          "usbhid"
          "uas"
          "sd_mod"
        ];
      };
      kernelPatches = [
        {
          name = "Rust Kernel Module";
          patch = null;
          features = {
            rust = true;
          };
        }
      ];
    };
  };
}
