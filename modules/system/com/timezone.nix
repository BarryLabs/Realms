{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.com.timezone;
in {
  options.augs.com.timezone.enable = mkEnableOption "enable the base timezone module";
  config = mkIf cfg.enable {
    time = {
      timeZone = lib.mkDefault config.var.timezone;
    };
  };
}
