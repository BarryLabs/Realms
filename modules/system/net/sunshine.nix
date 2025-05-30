{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.net.sunshine;
in {
  options.augs.net.sunshine.enable = mkEnableOption "enable sunshine";
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
