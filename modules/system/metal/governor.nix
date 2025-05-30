{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.metal.base.governor;
in {
  options.augs.metal.base.governor.enable = mkEnableOption "enable the base cpu-governor module";
  config = mkIf cfg.enable {
    powerManagement = {
      cpuFreqGovernor =
        if config.networking.hostName == "yggdrasil"
        then "performance"
        else "powersave";
    };
  };
}
