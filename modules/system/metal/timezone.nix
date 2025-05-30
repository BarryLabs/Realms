{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.metal.base.timezone;
in {
  options.augs.metal.base.timezone.enable = mkEnableOption "enable the base timezone module";
  config = mkIf cfg.enable {
    time = {
      timeZone = config.var.timezone;
    };
  };
}
