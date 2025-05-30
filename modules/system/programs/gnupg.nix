{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.programs.gnupg;
in {
  options.augs.programs.gnupg.enable = mkEnableOption "enable gnupg";
  config = mkIf cfg.enable {
    programs = {
      gnupg = {
        agent = {
          enable = true;
          enableSSHSupport = true;
        };
      };
    };
  };
}
