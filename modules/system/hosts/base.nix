{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.hosts.base;
in {
  options.augs.hosts.base.enable = mkEnableOption "enable the base template";
  config = mkIf cfg.enable {
    programs = {
      bash = {
        completion = {
          enable = true;
        };
        shellAliases =
          if !config.networking.hostName == "abyss" || "yggdrasil"
          then {
            nixupdate = "sudo nix flake update --flake /etc/nixos";
            nixbuild = "sudo nixos-rebuild switch";
            nixclean = "sudo nix-collect-garbage -d";
          }
          else {
          };
      };
    };
    boot = {
      kernelModules =
        if config.networking.hostName == "yggdrasil"
        then lib.mkDefault ["kvm-amd"]
        else lib.mkDefault ["kvm-intel"];
      kernelPackages =
        if !config.networking.hostName == "abyss" || "yggdrasil"
        then lib.mkDefault pkgs.linuxPackages_hardened
        else lib.mkDefault pkgs.linuxPackages_zen;
      kernelParams = lib.mkDefault [
        "slab_nomerge"
        "page_poison=1"
        "debugfs=off"
        "page_alloc.shuffle=1"
      ];
      initrd = {
        availableKernelModules =
          if !config.networking.hostName == "abyss" || "yggdrasil"
          then ["ata_piix" "uhci_hcd" "virtio_pci" "virtio_scsi" "sd_mod" "sr_mod"]
          else ["nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "uas" "sd_mod"];
      };
      loader = {
        grub = {
          enable =
            if !config.networking.hostName == "abyss" || "yggdrasil"
            then lib.mkDefault true
            else lib.mkDefault false;
          useOSProber =
            if !config.networking.hostName == "abyss" || "yggdrasil"
            then lib.mkDefault true
            else lib.mkDefault false;
        };
        systemd-boot = {
          enable =
            if config.networking.hostName == "abyss" || "yggdrasil"
            then lib.mkDefault true
            else lib.mkDefault false;
        };
        efi = {
          canTouchEfiVariables =
            if config.networking.hostName == "abyss" || "yggdrasil"
            then lib.mkDefault true
            else lib.mkDefault false;
        };
      };
    };
    documentation = {
      enable = lib.mkDefault false;
    };
    environment = {
      systemPackages = with pkgs; [
        git
        htop
      ];
    };
    powerManagement = {
      cpuFreqGovernor =
        if config.networking.hostName == "yggdrasil"
        then lib.mkDefault "performance"
        else lib.mkDefault "powersave";
    };
    i18n = {
      defaultLocale = lib.mkDefault config.var.locale;
      extraLocaleSettings = {
        LC_ADDRESS = lib.mkDefault config.var.locale;
        LC_IDENTIFICATION = lib.mkDefault config.var.locale;
        LC_MEASUREMENT = lib.mkDefault config.var.locale;
        LC_MONETARY = lib.mkDefault config.var.locale;
        LC_NAME = lib.mkDefault config.var.locale;
        LC_NUMERIC = lib.mkDefault config.var.locale;
        LC_PAPER = lib.mkDefault config.var.locale;
        LC_TELEPHONE = lib.mkDefault config.var.locale;
        LC_TIME = lib.mkDefault config.var.locale;
      };
    };
    #####
    networking = {
      hostName = lib.mkDefault config.var.host;
      firewall = {
        enable = lib.mkDefault true;
        allowedUDPPorts = lib.mkDefault [];
        allowedTCPPorts =
          if config.augs.metal.base.promtail.enable
          then [9002]
          else lib.mkDefault [];
      };
    };
    #####
    nix = {
      gc = {
        automatic = lib.mkDefault true;
        options = lib.mkDefault "--delete-older-than 7d";
        dates = lib.mkDefault "weekly";
      };
      settings = {
        auto-optimise-store = lib.mkDefault true;
        allowed-users = lib.mkDefault [
          "root"
          "@wheel"
        ];
        experimental-features = lib.mkDefault [
          "nix-command"
          "flakes"
        ];
      };
    };
    #####
    nixpkgs = {
      hostPlatform = lib.mkDefault "x86_64-linux";
      config = {
        allowUnfree = lib.mkDefault false;
      };
    };
    #####
    systemd = {
      services = {
        promtail = {
          description = "Promtail for Loki";
          wantedBy = ["multi-user.target"];
          serviceConfig = {
            ExecStart = ''
              ${pkgs.grafana-loki}/bin/promtail --config.file ${../../../.config/promtail/${config.var.host}.yaml}
            '';
          };
        };
      };
    };
    sops = {
      age = {
        keyFile = lib.mkDefault config.var.ageFile;
      };
      defaultSopsFormat = lib.mkDefault "yaml";
      defaultSopsFile = lib.mkDefault ../../../secrets/${config.var.host}.yaml;
    };
    system = {
      stateVersion = lib.mkDefault config.var.state;
    };
    time = {
      timeZone = lib.mkDefault config.var.timezone;
    };
    users = {
      users = {
        ${config.var.user} = {
          isNormalUser = lib.mkDefault true;
          createHome = lib.mkDefault true;
          home = lib.mkDefault config.var.home;
          description = lib.mkDefault config.var.desc;
          initialPassword = lib.mkDefault config.var.iniPass;
          extraGroups = lib.mkDefault [
            "wheel"
          ];
          openssh = {
            authorizedKeys = {
              keys = lib.mkDefault [
                "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICSv105WJyev8f1SA0p6WBLuEGxmdIUseZ5fXIZH8S3L"
              ];
            };
          };
        };
      };
    };
  };
}
