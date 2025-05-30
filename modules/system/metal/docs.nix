{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.metal.base.docs;
in {
  options.augs.metal.base.docs.enable = mkEnableOption "enable the base documentation module";
  config = mkIf cfg.enable {
    documentation = {
      enable = false;
    };
  };
}
