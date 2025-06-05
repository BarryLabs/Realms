{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.com.nixpkgs;
in {
  options.augs.com.nixpkgs.enable = mkEnableOption "enable the base nixpkgs module";
  config = mkIf cfg.enable {
    nixpkgs = {
      hostPlatform = lib.mkDefault "x86_64-linux";
      config = {
        allowUnfree = lib.mkDefault false;
      };
    };
  };
}
