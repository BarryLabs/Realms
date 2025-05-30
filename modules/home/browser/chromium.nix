{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.mods.browser.chromium;
in {
  options.mods.browser.chromium.enable = mkEnableOption "enable chromium";
  config = mkIf cfg.enable {
    programs = {
      chromium = {
        enable = true;
        commandLineArgs = [
          "--enable-logging=stderr"
          "--ignore-gpu-blocklist"
        ];
        extensions = [
          {
            id = "cjpalhdlnbpafiamejdnhcphjbkeiagm";
          }
        ];
      };
    };
  };
}
