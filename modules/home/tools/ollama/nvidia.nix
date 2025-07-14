{
  config,
  lib,
  ...
}:
with lib;
let
  cfg = config.mods.tools.ollama.nvidia;
in
{
  options.mods.tools.ollama.nvidia.enable = mkEnableOption "enable ollama module for nvidia GPU's";
  config = mkIf cfg.enable {
    services = {
      ollama = {
        enable = true;
        acceleration = "cuda";
      };
    };
  };
}
