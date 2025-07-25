{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.mods.cli.emacs.base;
in {
  options.mods.cli.emacs.base.enable = mkEnableOption "enable base emacs module";
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
