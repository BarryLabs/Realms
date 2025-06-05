{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.com.gnupg;
in {
  options.augs.com.gnupg.enable = mkEnableOption "enable gnupg";
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
