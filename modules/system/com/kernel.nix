{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.augs.com.kernel;
in {
  options.augs.com.kernel.enable = mkEnableOption "enable the base kernel module";
  config = mkIf cfg.enable {
    boot = {
      kernelModules =
        if config.networking.hostName == "yggdrasil"
        then ["kvm-amd"]
        else ["kvm-intel"];
      kernelPackages = lib.mkDefault pkgs.linuxPackages_hardened;
      kernelParams = [
        "slab_nomerge"
        "page_poison=1"
        "debugfs=off"
        "page_alloc.shuffle=1"
      ];
      initrd = lib.mkDefault {
        availableKernelModules = ["ata_piix" "uhci_hcd" "virtio_pci" "virtio_scsi" "sd_mod" "sr_mod"];
      };
    };
  };
}
