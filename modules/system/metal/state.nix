{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.metal.base.state;
in {
  options.augs.metal.base.state.enable = mkEnableOption "enable the base state module";
  config = mkIf cfg.enable {
    system = {
      stateVersion = config.var.state;
    };
  };
}
