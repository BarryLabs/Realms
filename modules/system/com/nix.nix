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
        automatic = true;
        options = lib.mkDefault "--delete-older-than 7d";
        dates = lib.mkDefault "weekly";
      };
      settings = {
        auto-optimise-store = true;
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
