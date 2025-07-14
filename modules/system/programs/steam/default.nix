{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.augs.programs.steam;
in
{
  options.augs.programs.steam.enable = mkEnableOption "enable steam essentials";
  config = mkIf cfg.enable {
    nixpkgs = {
      config = {
        allowUnfreePredicate =
          pkg:
          builtins.elem (lib.getName pkg) [
            "steam"
            "steam-unwrapped"
          ];
      };
    };
    environment = {
      systemPackages = [ pkgs.gamemode ];
    };
    programs = {
      gamemode = {
        enable = true;
      };
      steam = {
        enable = true;
        dedicatedServer = {
          openFirewall = true;
        };
        gamescopeSession = {
          enable = true;
        };
        remotePlay = {
          openFirewall = true;
        };
      };
    };
  };
}
