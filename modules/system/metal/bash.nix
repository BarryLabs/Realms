{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.metal.base.bash;
in {
  options.augs.metal.base.bash.enable = mkEnableOption "enable server bash configuration";
  config = mkIf cfg.enable {
    programs = {
      bash = {
        completion = {
          enable = true;
        };
        shellAliases = {
          nixupdate = "sudo nix flake update --flake /etc/nixos";
          nixbuild = "sudo nixos-rebuild switch";
          nixclean = "sudo nix-collect-garbage -d";
        };
      };
    };
  };
}
