{
  config,
  lib,
  ...
}:
with lib;
let
  cfg = config.augs.services.k3s.agent;
in
{
  options.augs.services.k3s.agent.enable = mkEnableOption "enable k3s agent";
  config = mkIf cfg.enable {
    services.k3s = {
      enable = true;
      role = "agent";
      token = "";
      serverAddr = "https://<orchestrator>:6443";
    };
  };
}
