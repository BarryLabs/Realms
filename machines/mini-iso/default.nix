{
  imports = [
    ./variables.nix
    ../../modules/system
  ];

  augs = {
    metal = {
      base = {
        bash.enable = true;
        cpu.enable = true;
        docs.enable = true;
        environment.enable = true;
        governor.enable = true;
        kernel.enable = true;
        locale.enable = true;
        network.enable = true;
        nix.enable = true;
        nixpkgs.enable = true;
        promtail.enable = true;
        sops.enable = true;
        state.enable = true;
        timezone.enable = true;
        users.enable = true;
        zram.enable = false;
        zfs.enable = false;
      };
    };
    net = {
      node-exporter.enable = false;
      openssh.enable = true;
    };
    system = {
      qemuguest.enable = false;
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
