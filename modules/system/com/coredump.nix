{
  config,
  lib,
  ...
}:
with lib;
let
  cfg = config.augs.com.coredump;
in
{
  options.augs.com.coredump.enable = mkEnableOption "enable coredump";
  config = mkIf cfg.enable {
    systemd = {
      coredump = {
        enable = true;
      };
    };
  };
}
