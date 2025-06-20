{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.mods.tools.pidgin;
in {
  options.mods.tools.pidgin.enable = mkEnableOption "enable pidgin";
  config = mkIf cfg.enable {
    programs = {
      pidgin = {
        enable = true;
        plugins = with pkgs; [
          pidgin-xmpp-receipts
          pidgin-opensteamworks
        ];
      };
    };
  };
}
