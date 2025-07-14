{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.augs.com.users;
in
{
  options.augs.com.users.enable = mkEnableOption "enable the base users module";
  config = mkIf cfg.enable {
    users = {
      users = {
        ${config.var.user} = {
          isNormalUser = true;
          createHome = true;
          home = config.var.home;
          shell = if config.networking.hostName == "yggdrasil" || "abyss" then pkgs.nushell else pkgs.bash;
          description = config.var.desc;
          initialPassword = config.var.iniPass;
          extraGroups =
            [
              "wheel"
            ]
            ++ (if config.augs.com.doas.enable then [ "doas" ] else [ ])
            ++ (if config.augs.com.podman.enable then [ "podman" ] else [ ])
            ++ (if config.augs.com.virt-manager.enable then [ "libvirtd" ] else [ ]);
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
