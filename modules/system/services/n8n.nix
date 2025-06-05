{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.services.n8n;
in {
  options.augs.services.n8n.enable = mkEnableOption "enable n8n";
  config = mkIf cfg.enable {
    services = {
      n8n = {
        enable = true;
        openFirewall = true;
        #webhookUrl = "";
        settings = {};
      };
    };
  };
}
