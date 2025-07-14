{
  imports = [
    ./disko.nix
    ./variables.nix
    ../../modules/system
  ];

  augs = {
    com = {
      apparmor.enable = true;
      bootEFI.enable = true;
      coredump.enable = true;
      cpu.enable = true;
      doas.enable = true;
      docs.enable = true;
      environment.enable = true;
      fhb.enable = true;
      fonts.enable = true;
      fstrim.enable = true;
      gnupg.enable = true;
      governor.enable = true;
      hyprlandPortal.enable = true;
      kernelDaily.enable = true;
      locale.enable = true;
      logrotate.enable = true;
      network.enable = true;
      nix.enable = true;
      nixpkgs.enable = true;
      nvidiaGPU.enable = true;
      openssh.enable = true;
      pam.enable = true;
      pipewire.enable = true;
      podman.enable = true;
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
      alvr.enable = true;
      appimages.enable = true;
      firejail.enable = true;
      hyprland.enable = true;
      localsend.enable = false;
      steam.enable = true;
      weylus.enable = false;
    };
    services = {
      flatpak.enable = false;
      openrgb.enable = true;
      sddm.enable = true;
    };
  };
  networking = {
    interfaces = {
      enp5s0 = {
        useDHCP = true;
      };
      enp6s0 = {
        useDHCP = true;
      };
    };
  };
}
