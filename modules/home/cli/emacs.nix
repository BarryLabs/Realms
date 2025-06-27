{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.mods.cli.emacs;
in {
  options.mods.cli.emacs.enable = mkEnableOption "enable emacs";
  config = mkIf cfg.enable {
    programs = {
      emacs = {
        enable = true;
        extraConfig = ''
          (setq standard-indent 2)
        '';
        extraPackages = epkgs: [
          epkgs.emms
          epkgs.magit
        ];
      };
    };
  };
}
