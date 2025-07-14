{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.augs.programs.firejail;
in
{
  options.augs.programs.firejail.enable = mkEnableOption "enable firejail";
  config = mkIf cfg.enable {
    programs = {
      firejail = {
        enable = true;
        wrappedBinaries = {
          qutebrowser = {
            executable = "${pkgs.lib.getBin pkgs.qutebrowser}/bin/qutebrowser";
            profile = "${pkgs.firejail}/etc/firejail/qutebrowser.profile";
          };
          mpv = {
            executable = "${pkgs.lib.getBin pkgs.mpv}/bin/mpv";
            profile = "${pkgs.firejail}/etc/firejail/mpv.profile";
          };
          zathura = {
            executable = "${pkgs.lib.getBin pkgs.zathura}/bin/zathura";
            profile = "${pkgs.firejail}/etc/firejail/zathura.profile";
          };
          firefox = {
            executable = "${pkgs.lib.getBin pkgs.firefox}/bin/firefox";
            profile = "${pkgs.firejail}/etc/firejail/firefox.profile";
          };
          # zen = {
          #   executable = "${pkgs.lib.getBin pkgs.zen}/bin/zen";
          #   profile = "${pkgs.firejail}/etc/firejail/zen.profile";
          # };
        };
      };
    };
  };
}
