{
  config,
  lib,
  ...
}:
with lib;
let
  cfg = config.augs.programs.ghidra;
in
{
  options.augs.programs.ghidra.enable = mkEnableOption "enable base ghidra module";
  config = mkIf cfg.enable {
    programs = {
      ghidra = {
        enable = true;
      };
    };
  };
}
