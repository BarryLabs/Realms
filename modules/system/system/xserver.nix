{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.system.xserver;
in {
  options.augs.system.xserver.enable = mkEnableOption "enable xserver";
  config = mkIf cfg.enable {
    services = {
      xserver = {
        #deviceSection = ''
        #  Option "DRI" "2"
        #  Option "TearFree" "true"
        #'';
        videoDrivers = ["intel" "nvidia"];
        xkb = {
          layout = "us";
          variant = "";
        };
      };
    };
  };
}
