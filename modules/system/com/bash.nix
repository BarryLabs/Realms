{
  config,
  lib,
  ...
}:
with lib;
let
  cfg = config.augs.com.bash;
in
{
  options.augs.com.bash.enable = mkEnableOption "enable server bash configuration";
  config = mkIf cfg.enable {
    programs = {
      bash = {
        completion = {
          enable = true;
        };
        shellAliases = lib.mkDefault {
          c = "clear";
          h = "history";

          ports = "netstat -tulanp";

          nr = "sudo nixos-rebuild switch";
          nc = "sudo nix-collect-garbage -d";
        };
      };
    };
  };
}
