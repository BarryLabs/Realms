{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.mods.cli.fzf;
in {
  options.mods.cli.fzf.enable = mkEnableOption "enable fuzzy finder";
  config = mkIf cfg.enable {
    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
      changeDirWidgetCommand = "fd --type d --exclude .git .jj --follow --hidden";
      defaultCommand = "fd --type f --exclude .git --follow --hidden";
      defaultOptions = [
        "--bind 'ctrl-/:toggle-preview'"
        "--preview='bat --color-always -n {}'"
      ];
    };
  };
}
