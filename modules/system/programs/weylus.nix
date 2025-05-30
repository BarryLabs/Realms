{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.programs.weylus;
in {
  options.augs.programs.weylus.enable = mkEnableOption "enable weylus";
  config = mkIf cfg.enable {
    programs = {
      weylus = {
        enable = true;
        openFirewall = true;
      };
    };
  };
}
