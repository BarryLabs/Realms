{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.mods.tools.obs.wayland;
in
{
  options.mods.tools.obs.wayland.enable = mkEnableOption "enable obs module for wayland";
  config = mkIf cfg.enable {
    programs = {
      obs-studio = {
        enable = true;
        plugins = with pkgs.obs-studio-plugins; [
          wlrobs
          input-overlay
          obs-vkcapture
          obs-backgroundremoval
          obs-pipewire-audio-capture
        ];
      };
    };
  };
}
