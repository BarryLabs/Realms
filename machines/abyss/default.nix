{
  imports = [
    ./disko.nix
    ./variables.nix
    ../../modules/system
  ];

  augs = {
    com = {
      bootEFI.enable = true;
      coredump.enable = true;
      cpu.enable = true;
      doas.enable = true;
      docs.enable = true;
      fhs.enable = true;
      fonts.enable = true;
      fstrim.enable = true;
      gnupg.enable = true;
      governor.enable = true;
      hyprlandPortal.enable = true;
      kernelDaily.enable = true;
      locale.enable = true;
      logrotate.enable = true;
      nix.enable = true;
      nixpkgs.enable = true;
      nvidiaGPU.enable = true;
      openssh.enable = true;
      pam.enable = true;
      pipewire.enable = true;
      podman.enable = true;
      promtail.enable = true;
      security.enable = true;
      state.enable = true;
      timezone.enable = true;
      udisks.enable = true;
      users.enable = true;
      virt-manager.enable = true;
      waydroid.enable = true;
      xboxController.enable = true;
      xserver.enable = true;
      zram.enable = true;
      zsh.enable = true;
    };
    programs = {
      appimages.enable = true;
      firejail.enable = true;
      hyprland.enable = true;
      steam.enable = true;
      weylus.enable = false;
    };
    services = {
      flatpak.enable = false;
      sddm.enable = true;
      node-exporter.enable = true;
    };
  };
  networking = {
    interfaces = {
      enp4s0 = {
        useDHCP = true;
      };
    };
    wireless = {
      iwd = {
        enable = true;
      };
    };
  };
}
