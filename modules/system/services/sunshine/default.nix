{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.services.sunshine;
in {
  options.augs.services.sunshine.enable = mkEnableOption "enable sunshine";
  config = mkIf cfg.enable {
    services = {
      sunshine = {
        enable = true;
        autoStart = true;
        capSysAdmin = true;
        openFirewall = true;
        applications = {};
      };
    };
  };
}
