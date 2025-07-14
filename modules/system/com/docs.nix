{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.com.docs;
in {
  options.augs.com.docs.enable = mkEnableOption "enable the base documentation module";
  config = mkIf cfg.enable {
    documentation = {
      enable = false;
    };
  };
}
