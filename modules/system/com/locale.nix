{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.com.locale;
in {
  options.augs.com.locale.enable = mkEnableOption "enable the base locale module";
  config = mkIf cfg.enable {
    i18n = {
      defaultLocale = lib.mkDefault config.var.locale;
      extraLocaleSettings = {
        LC_ADDRESS = lib.mkDefault config.var.locale;
        LC_IDENTIFICATION = lib.mkDefault config.var.locale;
        LC_MEASUREMENT = lib.mkDefault config.var.locale;
        LC_MONETARY = lib.mkDefault config.var.locale;
        LC_NAME = lib.mkDefault config.var.locale;
        LC_NUMERIC = lib.mkDefault config.var.locale;
        LC_PAPER = lib.mkDefault config.var.locale;
        LC_TELEPHONE = lib.mkDefault config.var.locale;
        LC_TIME = lib.mkDefault config.var.locale;
      };
    };
  };
}
