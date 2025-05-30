{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.mods.tools.ollama;
in {
  options.mods.tools.ollama.enable = mkEnableOption "enable ollama";
  config = mkIf cfg.enable {
    services = {
      ollama = {
        enable = true;
        acceleration = "cuda";
      };
    };
  };
}
