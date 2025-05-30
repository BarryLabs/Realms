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
        bootEFI.enable = false;
        bootGRUB.enable = true;
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
        vmVariant.enable = true;
        zram.enable = false;
      };
    };
    net = {
      backup = {
        borg.heimskringla.enable = true;
      };
      node-exporter.enable = true;
      openssh.enable = true;
      service = {
        gotify.enable = true;
        grafana.enable = true;
        homepage.enable = true;
        loki.enable = true;
        prometheus.enable = true;
      };
    };
    system = {
      qemuguest.enable = true;
    };
  };

  sops = {
    secrets = {};
  };

  networking = {
    firewall = {
      allowedTCPPorts = [3000 3100 8080 9001];
    };
  };
}
