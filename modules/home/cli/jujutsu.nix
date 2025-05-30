{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.mods.cli.jujutsu;
in {
  options.mods.cli.jujutsu.enable = mkEnableOption "enable jujutsu config";
  config = mkIf cfg.enable {
    programs = {
      jujutsu = {
        enable = true;
        ediff = true;
        settings = {
          user = {
            name = "BarryLabs";
            email = "wave.carton247@aleeas.com";
          };
        };
      };
    };
  };
}
