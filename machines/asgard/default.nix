{
  config,
  pkgs,
  ...
}: {
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
        sops.enable = false;
        state.enable = true;
        timezone.enable = true;
        users.enable = true;
        vmVariant.enable = true;
        zram.enable = false;
        zfs.enable = true;
      };
    };
    data = {
      postgres = {
        asgard.enable = true;
      };
    };
    net = {
      backups = {
        borg.asgard.enable = true;
      };
      node-exporter.enable = true;
      openssh.enable = true;
      service = {
        gitea.enable = true;
        nextcloud.enable = true;
      };
    };
    oci = {
      immich.enable = true;
      paperless.enable = true;
    };
    syncthing = {
      asgard.enable = true;
    };
    system = {
      qemuguest.enable = true;
    };
  };

  environment = {
    sessionVariables = {LIBVA_DRIVER_NAME = "iHD";};
  };

  hardware = {
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        intel-media-sdk
        intel-media-driver
        intel-vaapi-driver
        intel-compute-runtime
        vaapiVdpau
        vpl-gpu-rt
      ];
    };
  };

  # sops = {
  #   secrets = {
  #     localVoidEncKey = {
  #       mode = "0440";
  #     };
  #     remoteVoidEncKey = {
  #       mode = "0440";
  #     };
  #     pgAdminKey = {
  #       mode = "0440";
  #       owner = config.users.users.pgadmin.name;
  #       group = config.users.users.pgadmin.group;
  #       restartUnits = ["pgadmin.service"];
  #     };
  #     GiteaDBKey = {
  #       mode = "0440";
  #       owner = config.users.users.gitea.name;
  #       group = config.users.users.gitea.group;
  #       restartUnits = ["gitea.service"];
  #     };
  #     NextcloudAdminKey = {
  #       mode = "0440";
  #       owner = "nextcloud";
  #       group = "nextcloud";
  #       restartUnits = ["nextcloud-cron.timer" "nextcloud-update-db.service" "redis-nextcloud.service" "nginx.service" "phpfpm-nextcloud.service" "system-phpfpm.slice"];
  #     };
  #     NextcloudDBKey = {
  #       mode = "0440";
  #       owner = "nextcloud";
  #       group = "nextcloud";
  #       restartUnits = ["nextcloud-cron.timer" "nextcloud-update-db.service" "redis-nextcloud.service" "nginx.service" "phpfpm-nextcloud.service" "system-phpfpm.slice"];
  #     };
  #     SyncthingAdminKey = {
  #       mode = "0440";
  #       owner = "syncthing";
  #       group = "syncthing";
  #       restartUnits = ["syncthing-init.service" "syncthing.service"];
  #     };
  #   };
  # };

  networking = {
    hostId = "76d9d1e8";
    firewall = {
      allowedTCPPorts = [80 2283 3000 8000 8384];
    };
  };

  systemd = {
    services = {
      syncthing = {
        environment = {
          STNODEFAULTFOLDER = "true";
        };
      };
    };
  };
}
