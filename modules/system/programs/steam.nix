{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.augs.programs.steam;
in {
  options.augs.programs.steam.enable = mkEnableOption "enable steam and gamemode with stuffs";
  config = mkIf cfg.enable {
    environment = {
      systemPackages = [pkgs.gamemode];
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
