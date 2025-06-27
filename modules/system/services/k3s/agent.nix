{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.services.k3s.agent;
in {
  options.augs.services.k3s.agent.enable = mkEnableOption "enable k3s agent";
  config = mkIf cfg.enable {
    
  };
}
