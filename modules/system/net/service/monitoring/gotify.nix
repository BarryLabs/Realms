{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.net.service.gotify.heimskringla;
in {
  options.augs.net.service.gotify.heimskringla.enable = mkEnableOption "enable gotify for heimskringla";
  config = mkIf cfg.enable {
    services = {
      gotify = {
        enable = true;
        environment = {
          GOTIFY_SERVER_PORT = 8080;
          GOTIFY_DATABASE_DIALECT = "sqlite3";
        };
      };
    };
  };
}
