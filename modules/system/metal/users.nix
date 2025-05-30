{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.metal.base.users;
in {
  options.augs.metal.base.users.enable = mkEnableOption "enable the base users module";
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
              keys = [
                "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICSv105WJyev8f1SA0p6WBLuEGxmdIUseZ5fXIZH8S3L"
              ];
            };
          };
        };
      };
    };
  };
}
