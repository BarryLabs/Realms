{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.com.openssh;
in {
  options.augs.com.openssh.enable = mkEnableOption "enable sane openssh";
  config = mkIf cfg.enable {
    services = {
      openssh = {
        enable = true;
        startWhenNeeded = true;
        settings = {
          PermitRootLogin = "no";
          PasswordAuthentication = false;
        };
      };
    };
  };
}
