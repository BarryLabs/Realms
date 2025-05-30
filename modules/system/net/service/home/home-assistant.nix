{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.net.service.home-assistant;
in {
  options.augs.net.service.home-assistant.enable = mkEnableOption "enable home-assistant";
  config = mkIf cfg.enable {
    # nixpkgs.config.permittedInsecurePackages = [
    #   "openssl-1.1.1w"
    # ];
    services = {
      home-assistant = {
        enable = true;
        openFirewall = true;
        configWritable = false;
        config = {
          default_config = {};
        };
        extraComponents = [
          "met"
          "esphome"
          "radio_browser"
        ];
        # extraPackages = ps: with ps; [
        #
        # ];
      };
    };
  };
}
