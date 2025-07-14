{
  config,
  lib,
  ...
}:
with lib;
let
  cfg = config.mods.cli.nushell.base;
in
{
  options.mods.cli.nushell.base.enable = mkEnableOption "enable base nushell module";
  config = mkIf cfg.enable {
    programs = {
      carapace = {
        enable = true;
        enableNushellIntegration = true;
      };
      nushell = {
        enable = true;
        shellAliases = {
          l = "ls -a";
          c = "clear";
          h = "history";
          ports = "netstat -tulanp";
          nb = "doas nixos-rebuild switch --flake $env.flakePath";
          nc = "doas nix-collect-garbage -d";
        };
        extraConfig = ''
          $env.EDITOR = "nvim"
          $env.NIX_LOG = "info"
          $env.NIX_PATH = "nixpkgs=channel:nixos-unstable"
          $env.flakePath = "~/Projects/Repos/RealmsGitea/";

          let carapace_completer = {|spans|
          carapace $spans.0 nushell ...$spans | from json
          }

          $env.config = {
           show_banner: false,
           completions: {
           case_sensitive: false # case-sensitive completions
           quick: true    # set to false to prevent auto-selecting completions
           partial: true    # set to false to prevent partial filling of the prompt
           algorithm: "fuzzy"    # prefix or fuzzy
           external: {
           # set to false to prevent nushell looking into $env.PATH to find more suggestions
               enable: true 
           # set to lower can improve completion performance at the cost of omitting some options
               max_results: 100 
               completer: $carapace_completer # check 'carapace_completer' 
             }
           }
          }

          $env.PATH = ($env.PATH |
          split row (char esep) |
          prepend /home/chandler/.apps |
          append /usr/bin/env
          )
        '';
      };
    };
  };
}
