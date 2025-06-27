{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.augs.hosts.abyss;
in {
  options.augs.hosts.abyss.enable = mkEnableOption "enable abyss' system configuration";
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
      kernelModules = ["kvm-intel" "v4l2loopback" "nvme"];
      extraModulePackages = [
        config.boot.kernelPackages.v4l2loopback
      ];
      initrd = {
        availableKernelModules = ["xhci_pci" "ahci" "usb_storage" "usbhid" "uas" "sd_mod"];
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
      kernelParams = [
        "slab_nomerge"
        "page_poison=1"
        "debugfs=off"
        "page_alloc.shuffle=1"
      ];
    };
    documentation = {
      enable = false;
    };
    environment = {
      variables = {
        MAMOT_OS = "true";
        MAMOT_OS_VERSION = "1.1.0";
      };
      systemPackages = with pkgs; [
        git
        htop
        python313Full
        (
          catppuccin-sddm.override {
            flavor = "mocha";
            font = config.var.scpFont;
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
    hardware = {
      cpu = {
        intel = {
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
        package = config.boot.kernelPackages.nvidiaPackages.beta;
        modesetting = {
          enable = true;
        };
        prime = {
          intelBusId = config.var.i630Id;
          nvidiaBusId = config.var.d1660Id;
          sync = {
            enable = true;
          };
          #offload = {
          #  enable = true;
          #  enableOffloadCmd = true;
          #};
        };
      };
      xone = {
        enable = true;
      };
    };
    sops = {
      age = {
        keyFile = config.var.ageFile;
      };
      defaultSopsFile = ../../../secrets/abyss.yaml;
      defaultSopsFormat = "yaml";
      secrets = {
        Nixfleet = {
          mode = "0400";
        };
        bbEvo = {
          mode = "0400";
        };
        borgJob = {
          mode = "0400";
        };
        localEvoEncKey = {
          mode = "0400";
        };
        remoteEvoEncKey = {
          mode = "0400";
        };
      };
    };
    i18n = {
      defaultLocale = "en_US.UTF-8";
      extraLocaleSettings = {
        LC_ADDRESS = "en_US.UTF-8";
        LC_IDENTIFICATION = "en_US.UTF-8";
        LC_MEASUREMENT = "en_US.UTF-8";
        LC_MONETARY = "en_US.UTF-8";
        LC_NAME = "en_US.UTF-8";
        LC_NUMERIC = "en_US.UTF-8";
        LC_PAPER = "en_US.UTF-8";
        LC_TELEPHONE = "en_US.UTF-8";
        LC_TIME = "en_US.UTF-8";
      };
    };
    time = {
      timeZone = "America/New_York";
    };

    networking = {
      hostName = "abyss";
      firewall = {
        enable = true;
        allowedTCPPorts = [];
        allowedUDPPorts = [];
      };
      interfaces = {
        enp4s0 = {
          useDHCP = lib.mkDefault true;
        };
      };
      wireless = {
        iwd = {
          enable = true;
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
        experimental-features = [
          "nix-command"
          "flakes"
        ];
        log-lines = lib.mkDefault 25;
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
        "fhsHandler" = {
          text = ''
            install -d -m 755 /home/${config.var.user}/Documents -o ${config.var.user} -g users;
            install -d -m 755 /home/${config.var.user}/Documents/Notes -o ${config.var.user} -g users;
            install -d -m 755 /home/${config.var.user}/Downloads -o ${config.var.user} -g users;
            install -d -m 755 /home/${config.var.user}/Music -o ${config.var.user} -g users;
            install -d -m 755 /home/${config.var.user}/Pictures -o ${config.var.user} -g users;
            install -d -m 755 /home/${config.var.user}/Projects -o ${config.var.user} -g users;
            install -d -m 755 /home/${config.var.user}/Projects/Repos -o ${config.var.user} -g users;
            install -d -m 755 /home/${config.var.user}/Videos -o ${config.var.user} -g users;
          '';
        };
      };
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
              ${pkgs.grafana-loki}/bin/promtail --config.file ${../../../.config/promtail/abyss.yaml}
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
      defaultUserShell = pkgs.zsh;
      users = {
        ${config.var.user} = {
          createHome = true;
          isNormalUser = true;
          description = config.var.desc;
          initialPassword = config.var.iniPass;
          home = "/home/${config.var.user}";
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
        extraPortals = [
          pkgs.xdg-desktop-portal-gtk
          pkgs.xdg-desktop-portal
        ];
        configPackages = [
          pkgs.xdg-desktop-portal-gtk
          pkgs.xdg-desktop-portal-hyprland
          pkgs.xdg-desktop-portal
        ];
      };
    };
    zramSwap = {
      enable = true;
      algorithm = "zstd";
    };
    system = {
      stateVersion = config.var.state;
    };
  };
}
