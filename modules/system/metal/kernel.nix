{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.augs.metal.base.kernel;
in {
  options.augs.metal.base.kernel.enable = mkEnableOption "enable the base kernel module";
  config = mkIf cfg.enable {
    boot = {
      kernelModules = ["kvm-intel"];
      kernelPackages = pkgs.linuxPackages_hardened;
      kernelParams = [
        "slab_nomerge"
        "page_poison=1"
        "debugfs=off"
        "page_alloc.shuffle=1"
      ];
      initrd = {
        availableKernelModules = ["ata_piix" "uhci_hcd" "virtio_pci" "virtio_scsi" "sd_mod" "sr_mod"];
      };
    };
  };
}
