{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.mods.cli.nixvim.tsGrammars;
in {
  options.mods.cli.nixvim.tsGrammars.enable = mkEnableOption "enable nixvim treesitter grammars";
  config = mkIf cfg.enable {
    plugins.treesitter = {
      enable = true;
      grammarPackages =
        if config.mods.cli.nixvim.tsGrammars.enable
        then
          with pkgs.tree-sitter-grammars; [
            tree-sitter-norg
            tree-sitter-bash
            tree-sitter-json
            tree-sitter-lua
            tree-sitter-make
            tree-sitter-markdown
            tree-sitter-nix
            tree-sitter-regex
            tree-sitter-toml
            tree-sitter-vim
            tree-sitter-yaml
          ]
        else with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [];
    };
  };
}
