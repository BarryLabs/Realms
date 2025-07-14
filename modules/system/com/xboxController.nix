{
  config,
  lib,
  ...
}:
with lib;
let
  cfg = config.augs.com.xboxController;
in
{
  options.augs.com.xboxController.enable = mkEnableOption "enable xbox controller essentials";
  config = mkIf cfg.enable {
    hardware = {
      xone = {
        enable = true;
      };
    };
  };
}
