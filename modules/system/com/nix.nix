{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.com.nix;
in {
  options.augs.com.nix.enable = mkEnableOption "enable the base nix module";
  config = mkIf cfg.enable {
    nix = {
      gc = {
        automatic = lib.mkDefault true;
        options = lib.mkDefault "--delete-older-than 7d";
        dates = lib.mkDefault "weekly";
      };
      settings = {
        auto-optimise-store = lib.mkDefault true;
        allowed-users = lib.mkDefault [
          "root"
          "@wheel"
        ];
        experimental-features = lib.mkDefault [
          "nix-command"
          "flakes"
        ];
      };
    };
  };
}
