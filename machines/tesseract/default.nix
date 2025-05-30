{
  imports = [
    ./disko.nix
    ./variables.nix
    ../../modules/system
  ];

  augs = {
    metal = {
      base = {
        bash.enable = true;
        bootGRUB.enable = true;
        cpu.enable = false;
        docs.enable = true;
        environment.enable = true;
        governor.enable = true;
        kernel.enable = true;
        locale.enable = true;
        network.enable = true;
        nix.enable = true;
        nixpkgs.enable = true;
        promtail.enable = true;
        sops.enable = false;
        state.enable = true;
        timezone.enable = true;
        users.enable = true;
        vmVariant.enable = true;
        zfs.enable = false;
        zram.enable = false;
      };
    };
    net = {
      node-exporter.enable = true;
      openssh.enable = true;
    };
    service = {
      minecraft = {
        tesseract.enable = true;
      };
    };
    system = {
      qemuguest.enable = true;
    };
  };

  networking = {
    firewall = {
      allowedTCPPorts = [22];
    };
  };
  sops = {
    secrets = {};
  };
}
