{
  imports = [
    ./disko.nix
    ./variables.nix
    ../../modules/system
  ];

  augs = {
    hosts.abyss.enable = true;
    borg.abyss.enable = true;
    sync.abyss.enable = true;
    com = {
      bluetooth.enable = true;
      fstrim.enable = true;
      gnupg.enable = true;
      logrotate.enable = true;
      openssh.enable = true;
      pipewire.enable = true;
      podman.enable = true;
      udisks.enable = true;
      virt-manager.enable = true;
      waydroid.enable = true;
      xserver.enable = true;
      zsh.enable = true;
    };
    programs = {
      appimages.enable = true;
      firejail.enable = true;
      hyprland.enable = true;
      localsend.enable = false;
      steam.enable = true;
      weylus.enable = false;
    };
    services = {
      flatpak.enable = false;
      sddm.enable = true;
      node-exporter.enable = true;
    };
    vpn = {
      openvpn = {
        wun.enable = false;
      };
    };
  };
}
