{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.com.state;
in {
  options.augs.com.state.enable = mkEnableOption "enable the base state module";
  config = mkIf cfg.enable {
    system = {
      stateVersion = lib.mkDefault config.var.state;
    };
  };
}
