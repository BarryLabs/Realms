{pkgs, ...}: {
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
        cpu.enable = false;
        docs.enable = true;
        environment.enable = true;
        governor.enable = true;
        kernel.enable = true;
        locale.enable = true;
        network.enable = true;
        nix.enable = true;
        nixpkgs.enable = true;
        promtail.enable = false;
        sops.enable = false;
        state.enable = true;
        timezone.enable = true;
        users.enable = true;
        vmVariant.enable = true;
      };
    };
    system = {
      qemuguest.enable = true;
    };
  };

  networking = {
    firewall = {
      allowedTCPPorts = [];
    };
  };

  environment = {
    systemPackages = with pkgs; [
      curl
      john
      nmap
      aircrack-ng
      tcpdump
      metasploit
      nikto
      proxychains
    ];
  };
}
