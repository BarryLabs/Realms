{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.augs.com.environment;
in
{
  options.augs.com.environment.enable = mkEnableOption "enable the base environment module";
  config = mkIf cfg.enable {
    environment = {
      systemPackages =
        with pkgs;
        [
          git
          htop
        ]
        ++ (
          if config.augs.com.kernelDaily.enable then
            [
              python313Full
              (catppuccin-sddm.override {
                flavor = "mocha";
                font = "Source Code Pro";
                fontSize = "18";
                background = "${../../../.config/sddm/catppuccin.png}";
                loginBackground = true;
              })
            ]
          else
            [ ]
        );
    };
  };
}
