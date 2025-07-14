{
  config,
  lib,
  outputs,
  ...
}:
with lib;
let
  cfg = config.augs.com.hmDerivations;
in
{
  options.augs.com.hmDerivations.enable = mkEnableOption "enable home-manager derivations";
  config = mkIf cfg.enable {
    imports = builtins.attrValues outputs.homeManagerModules;
  };
}
