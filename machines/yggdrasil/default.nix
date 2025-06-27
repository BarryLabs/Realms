{
  imports = [
    ./disko.nix
    ./variables.nix
    ../../modules/system
  ];

  augs = {
    hosts.yggdrasil.enable = true;
    borg.yggdrasil.enable = true;
    sync.yggdrasil.enable = true;
    com = {
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
      node-exporter.enable = true;
    };
    vpn = {
      openvpn = {
        wun.enable = true;
      };
      wireguard = {
        wun.enable = true;
      };
    };
  };
}
