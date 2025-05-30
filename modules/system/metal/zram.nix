{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.metal.base.zram;
in {
  options.augs.metal.base.zram.enable = mkEnableOption "enable the base zram module";
  config = mkIf cfg.enable {
    zramSwap = {
      enable = true;
      algorithm = "zstd";
    };
  };
}
