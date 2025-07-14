{
  config,
  lib,
  ...
}:
with lib;
let
  cfg = config.augs.com.doas;
in
{
  options.augs.com.doas.enable = mkEnableOption "enable doas";
  config = mkIf cfg.enable {
    security = {
      sudo = {
        enable = false;
      };
      doas = {
        enable = true;
        extraRules = [
          {
            groups = [ "doas" ];
            noPass = false;
            keepEnv = true;
          }
        ];
      };
    };
  };
}
