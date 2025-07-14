{
  config,
  lib,
  ...
}:
with lib;
let
  cfg = config.augs.com.apparmor;
in
{
  options.augs.com.apparmor.enable = mkEnableOption "enable apparmor";
  config = mkIf cfg.enable {
    security = {
      apparmor = {
        enable = true;
        killUnconfinedConfinables = true;
      };
    };
  };
}
