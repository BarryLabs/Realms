{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.com.xserver;
in {
  options.augs.com.xserver.enable = mkEnableOption "enable xserver";
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
