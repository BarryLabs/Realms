{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.metal.base.nix;
in {
  options.augs.metal.base.nix.enable = mkEnableOption "enable the base nix module";
  config = mkIf cfg.enable {
    nix = {
      gc = {
        automatic = true;
        options = "--delete-older-than 7d";
        dates = "weekly";
      };
      settings = {
        auto-optimise-store = lib.mkDefault true;
        allowed-users = [
          "root"
          "@wheel"
        ];
        experimental-features = [
          "nix-command"
          "flakes"
        ];
      };
    };
  };
}
