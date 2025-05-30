{
  imports = [
    ./disko.nix
    ./variables.nix
    ../../modules/system
  ];
  augs = {
    metal = {
      template = {
        abyss.enable = true;
      };
    };
    net = {
      backup = {
        borg = {
          abyss.enable = true;
        };
      };
      node-exporter.enable = true;
      openssh.enable = true;
      syncthing.abyss.enable = true;
      vpn.openvpn.mullvadUS.enable = true;
    };
    programs = {
      appimages.enable = true;
      firejail.enable = true;
      gnupg.enable = true;
      hyprland.enable = true;
      localsend.enable = true;
      steam.enable = true;
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
