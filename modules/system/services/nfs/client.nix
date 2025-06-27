{
  config,
  lib,
  ...
}:
with lib;
let
  cfg = config.augs.services.nfs.default;
in
{
  options.augs.services.nfs.default.enable = mkEnableOption "enable default nfs module";
  config = mkIf cfg.enable {

  };
}
