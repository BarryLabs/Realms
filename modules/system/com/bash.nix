{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.augs.com.bash;
in {
  options.augs.com.bash.enable = mkEnableOption "enable server bash configuration";
  config = mkIf cfg.enable {
    programs = {
      bash = {
        completion = {
          enable = true;
        };
        shellAliases = lib.mkDefault {
          nixbuild = "sudo nixos-rebuild switch";
          nixclean = "sudo nix-collect-garbage -d";
        };
      };
    };
  };
}
