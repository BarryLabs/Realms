{
  imports = [
    ./disko.nix
    ./variables.nix
    ../../modules/system
  ];

  augs = {
    metal = {
      template = {
        yggdrasil.enable = true;
      };
    };
    net = {
      backup = {
        borg = {
          yggdrasil.enable = true;
        };
      };
      node-exporter.enable = true;
      openssh.enable = true;
      syncthing = {
        yggdrasil.enable = true;
      };
      vpn.openvpn.mullvadUS.enable = true;
    };
    programs = {
      appimages.enable = true;
      firejail.enable = true;
      gnupg.enable = true;
      hyprland.enable = true;
      localsend.enable = true;
      steam.enable = true;
      weylus.enable = false;
      zsh.enable = true;
    };
    services = {
      flatpak.enable = false;
      sddm.enable = true;
    };
    system = {
      fstrim.enable = true;
      logrotate.enable = true;
      pipewire.enable = true;
      udisks.enable = true;
      xserver.enable = true;
    };
    virtualisation = {
      podman.enable = true;
      virt-manager.enable = true;
      waydroid.enable = true;
    };
  };
}
