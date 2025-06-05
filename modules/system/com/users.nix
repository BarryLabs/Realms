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
