{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.augs.hosts.yggdrasil;
in {
  options.augs.hosts.yggdrasil.enable = mkEnableOption "enable yggdrasil's system configuration";
  config = mkIf cfg.enable {
    boot = {
      loader = {
        efi = {
          canTouchEfiVariables = true;
        };
        systemd-boot = {
          enable = true;
        };
      };
      kernelPackages = pkgs.linuxPackages_zen;
      kernelModules = [
        "kvm-amd"
        "snd_aloop"
        "v4l2loopback"
      ];
      extraModulePackages = [
        config.boot.kernelPackages.v4l2loopback
      ];
      initrd = {
        availableKernelModules = [
          "nvme"
          "xhci_pci"
          "ahci"
          "usb_storage"
          "usbhid"
          "uas"
          "sd_mod"
        ];
      };
      kernelPatches = [
        {
          name = "Rust Kernel Module";
          patch = null;
          features = {
            rust = true;
          };
        }
      ];
    };
    documentation = {
      enable = false;
    };
    environment = {
      systemPackages = with pkgs; [
        git
        htop
        python313Full
        (
          catppuccin-sddm.override {
            flavor = "mocha";
            font = "Source Code Pro";
            fontSize = "18";
            background = "${../../../.config/sddm/catppuccin.png}";
            loginBackground = true;
          }
        )
      ];
    };
    fonts = {
      enableDefaultPackages = true;
      packages = with pkgs; [
        jetbrains-mono
        source-code-pro
        font-awesome
        openmoji-color
        noto-fonts-emoji
      ];
      fontconfig = {
        enable = true;
        useEmbeddedBitmaps = true;
      };
    };
    fileSystems = {
      "/mnt/Storage" = {
        fsType = "ntfs";
        device = "/dev/disk/by-uuid/CC3A7A573A7A3F10";
      };
    };
    hardware = {
      cpu = {
        amd = {
          updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
        };
      };
      graphics = {
        enable = true;
        enable32Bit = true;
      };
      nvidia = {
        open = false;
        nvidiaSettings = true;
        modesetting = {
          enable = true;
        };
        package = config.boot.kernelPackages.nvidiaPackages.beta;
      };
      xone = {
        enable = true;
      };
    };
    sops = {
      age = {
        keyFile = config.var.ageFile;
      };
      defaultSopsFile = ../../../secrets/yggdrasil.yaml;
      defaultSopsFormat = "yaml";
      secrets = {
        Nixfleet = {
          mode = "0400";
        };
        borgJob = {
          mode = "0400";
        };
        localTowerEncKey = {
          mode = "0400";
        };
        localTowerEncRepo = {
          mode = "0400";
        };
        bbTower = {
          mode = "0400";
        };
        remoteTowerEncKey = {
          mode = "0400";
        };
        remoteTowerEncRepo = {
          mode = "0400";
        };
      };
    };
    i18n = {
      defaultLocale = config.var.locale;
      extraLocaleSettings = {
        LC_ADDRESS = config.var.locale;
        LC_IDENTIFICATION = config.var.locale;
        LC_MEASUREMENT = config.var.locale;
        LC_MONETARY = config.var.locale;
        LC_NAME = config.var.locale;
        LC_NUMERIC = config.var.locale;
        LC_PAPER = config.var.locale;
        LC_TELEPHONE = config.var.locale;
        LC_TIME = config.var.locale;
      };
    };

    time = {
      timeZone = config.var.timezone;
    };

    networking = {
      hostName = config.var.host;
      firewall = {
        enable = true;
        allowedTCPPorts = [];
        allowedUDPPorts = [];
      };
      interfaces = {
        enp5s0 = {
          useDHCP = lib.mkDefault true;
        };
        enp6s0 = {
          useDHCP = lib.mkDefault true;
        };
      };
    };

    nix = {
      gc = {
        automatic = true;
        options = "--delete-older-than 7d";
        dates = "weekly";
      };
      settings = {
        auto-optimise-store = lib.mkDefault true;
        allowed-users = [
          "root"
          "@wheel"
        ];
        experimental-features = [
          "nix-command"
          "flakes"
        ];
      };
    };

    nixpkgs = {
      hostPlatform = lib.mkDefault "x86_64-linux";
      config = {
        allowUnfreePredicate = pkg:
          builtins.elem (lib.getName pkg) [
            "nvidia-x11"
            "nvidia-settings"
            "steam"
            "steam-unwrapped"
            "xow_dongle-firmware"
            "cuda_cudart"
            "libcublas"
            "cuda_cccl"
            "cuda_nvcc"
          ];
      };
    };
    powerManagement = {
      cpuFreqGovernor = "performance";
    };
    security = {
      apparmor = {
        enable = true;
        killUnconfinedConfinables = true;
      };
      rtkit = {
        enable = true;
      };
      polkit = {
        enable = true;
      };
      pam = {
        services = {
          hyprlock = {};
        };
      };
      sudo = {
        enable = false;
      };
      doas = {
        enable = true;
        extraRules = [
          {
            groups = ["doas"];
            noPass = false;
            keepEnv = true;
          }
        ];
      };
      virtualisation = {
        flushL1DataCache = "always";
      };
      forcePageTableIsolation = true;
      lockKernelModules = true;
      protectKernelImage = true;
      unprivilegedUsernsClone = config.virtualisation.containers.enable;
    };
    system = {
      activationScripts = {
        "fhsInit" = {
          text = ''
            install -d -m 755 /mnt/USB -o ${config.var.user} -g users
            install -d -m 755 /home/${config.var.user}/Documents -o ${config.var.user} -g users
            install -d -m 755 /home/${config.var.user}/Downloads -o ${config.var.user} -g users
            install -d -m 755 /home/${config.var.user}/Music -o ${config.var.user} -g users
            install -d -m 755 /home/${config.var.user}/Pictures -o ${config.var.user} -g users
            install -d -m 755 /home/${config.var.user}/Projects -o ${config.var.user} -g users
            install -d -m 755 /home/${config.var.user}/Videos -o ${config.var.user} -g users
          '';
        };
      };
      stateVersion = config.var.state;
    };
    systemd = {
      coredump = {
        enable = true;
      };
      services = {
        promtail = {
          description = "Promtail for Loki";
          wantedBy = ["multi-user.target"];
          serviceConfig = {
            ExecStart = ''
              ${pkgs.grafana-loki}/bin/promtail --config.file ${../../../.config/promtail/yggdrasil.yaml}
            '';
          };
        };
        syncthing = {
          environment = {
            STNODEFAULTFOLDER = "true";
          };
        };
      };
    };
    users = {
      defaultUserShell = pkgs.nushell;
      users = {
        ${config.var.user} = {
          isNormalUser = true;
          createHome = true;
					shell = pkgs.nushell;
          description = config.var.desc;
          initialPassword = config.var.iniPass;
          home = config.var.home;
          extraGroups =
            [
              "wheel"
              "doas"
            ]
            ++ (
              if config.augs.com.podman.enable
              then ["podman"]
              else []
            )
            ++ (
              if config.augs.com.virt-manager.enable
              then ["libvirtd"]
              else []
            );
          openssh = {
            authorizedKeys = {
              keys = [
                "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICSv105WJyev8f1SA0p6WBLuEGxmdIUseZ5fXIZH8S3L"
              ];
            };
          };
        };
      };
    };
    xdg = {
      portal = {
        enable = true;
        wlr = {
          enable = true;
        };
        configPackages = [
          pkgs.xdg-desktop-portal-hyprland
        ];
      };
    };
    zramSwap = {
      enable = true;
      algorithm = "zstd";
    };
  };
}
