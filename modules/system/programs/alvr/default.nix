{
  config,
  lib,
  ...
}:
with lib;
let
  cfg = config.augs.programs.alvr;
in
{
  options.augs.programs.alvr.enable = mkEnableOption "enable alvr";
  config = mkIf cfg.enable {
    programs = {
      alvr = {
        enable = true;
        openFirewall = true;
      };
    };
  };
}
