{
  imports = [
    ./backup/borg-abyss.nix
    ./backup/borg-aegir.nix
    ./backup/borg-asgard.nix
    ./backup/borg-heimskringla.nix
    ./backup/borg-yggdrasil.nix

    ./com/bash.nix
    ./com/bootEFI.nix
    ./com/bootGRUB.nix
    ./com/cpu.nix
    ./com/docs.nix
    ./com/environment.nix
    ./com/fhb.nix
    ./com/fstrim.nix
    ./com/gnupg.nix
    ./com/governor.nix
    ./com/k3s.nix
    ./com/kernel.nix
    ./com/locale.nix
    ./com/logrotate.nix
    ./com/network.nix
    ./com/nix.nix
    ./com/nixpkgs.nix
    ./com/openrgb.nix
    ./com/openssh.nix
    ./com/pipewire.nix
    ./com/podman.nix
    ./com/qemuguest.nix
    ./com/sops.nix
    ./com/state.nix
    ./com/timezone.nix
    ./com/udisks.nix
    ./com/users.nix
    ./com/virt-manager.nix
    ./com/vmVariant.nix
    ./com/waydroid.nix
    ./com/xserver.nix
    ./com/zfs.nix
    ./com/zram.nix
    ./com/zsh.nix

    #./email/mailserver.nix

    ./hosts/abyss.nix
    #./hosts/base.nix
    ./hosts/yggdrasil.nix

    #./minecraft/BigChadGuys.nix

    ./nfs/nfs-asgard.nix

    ./oci/immich-asgard.nix
    ./oci/paperless-asgard.nix
    ./oci/torrent-aegir.nix
    ./oci/transcode-aegir.nix

    ./programs/appimages.nix
    ./programs/firejail.nix
    ./programs/hyprland.nix
    ./programs/localsend.nix
    ./programs/steam.nix
    ./programs/weylus.nix

    ./services/arr.nix
    ./services/database.nix
    ./services/flatpak.nix
    ./services/frigate.nix
    ./services/gitea.nix
    ./services/gotify.nix
    ./services/grafana.nix
    ./services/home-assistant.nix
    ./services/homepage.nix
    ./services/loki.nix
    ./services/n8n.nix
    ./services/nextcloud.nix
    ./services/node-exporter.nix
    ./services/postgres.nix
    ./services/prometheus.nix
    ./services/promtail.nix
    ./services/qdrant.nix
    ./services/sddm.nix
    ./services/sunshine.nix
    ./services/syncthing.nix

    ./smb/smb-asgard.nix

    ./sync/sync-abyss.nix
    ./sync/sync-asgard.nix
    ./sync/sync-yggdrasil.nix

    ./vpn/openvpn
    ./vpn/wireguard
  ];
}
