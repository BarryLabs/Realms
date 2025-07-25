{
  config,
  lib,
  ...
}:
with lib;
let
  cfg = config.augs.com.pam;
in
{
  options.augs.com.pam.enable = mkEnableOption "enable pam";
  config = mkIf cfg.enable {
    security = {
      rtkit = {
        enable = true;
      };
      polkit = {
        enable = true;
      };
      pam = {
        services = {
          hyprlock = { };
        };
      };
    };
  };
}
