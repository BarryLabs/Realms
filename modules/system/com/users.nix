{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.com.users;
in {
  options.augs.com.users.enable = mkEnableOption "enable the base users module";
  config = mkIf cfg.enable {
    users = {
      users = {
        ${config.var.user} = {
          isNormalUser = true;
          createHome = true;
          home = config.var.home;
          description = config.var.desc;
          initialPassword = config.var.iniPass;
          extraGroups = [
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
