{
  config,
  lib,
  inputs,
  ...
}:
with lib; let
  cfg = config.augs.net.service.minecraft.tesseract;
in {
  imports = [
    inputs.nix-minecraft.nixosModules.minecraft-servers
  ];
  nixpkgs.overlays = [
    inputs.nix-minecraft.overlay
  ];
  options.augs.net.service.minecraft.tesseract.enable = mkEnableOption "enable minecraft for tesseract";
  config = mkIf cfg.enable {
    services = {
      minecraft-servers = {
        enable = true;
        eula = true;
        package = pkgs.fabricServers.fabric-1_20_1;
        servers = {
          BigChadGuys = {
            enable = true;
            whitelist = {
              /**/
            };
            serverProperties = {
              server-port = 25565;
            };
            # symlinks = let
            #   modpack = (pkgs.fetchPackwizModpack {
            #     url = "https://pack.toml";
            #     packHash = "sha256hash";
            #   });
            # in {
            #   "mods" = "${modpack}/mods"
            # }
          };
        };
      };
    };
  };
}
