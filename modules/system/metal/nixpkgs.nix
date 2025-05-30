{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.metal.base.nixpkgs;
in {
  options.augs.metal.base.nixpkgs.enable = mkEnableOption "enable the base nixpkgs module";
  config = mkIf cfg.enable {
    nixpkgs = {
      hostPlatform = lib.mkDefault "x86_64-linux";
      config = {
        allowUnfree = lib.mkDefault false;
      };
    };
  };
}
