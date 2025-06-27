{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.com.zram;
in {
  options.augs.com.zram.enable = mkEnableOption "enable the base zram module";
  config = mkIf cfg.enable {
    zramSwap = {
      enable = lib.mkDefault true;
      algorithm = lib.mkDefault "zstd";
    };
  };
}
