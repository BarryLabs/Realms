{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.mods.files.yazi;
in {
  options.mods.files.yazi.enable = mkEnableOption "enable yazi";
  config = mkIf cfg.enable {
    programs = {
      yazi = {
        enable = true;
        enableZshIntegration = true;
        settings = {
          log = {
            enabled = false;
          };
          manager = {
            ratio = [
              2
              4
              3
            ];
            show_hidden = true;
            sort_dir_first = true;
            sort_reverse = false;
            sort_sensitive = true;
            show_symlink = true;
          };
          tasks = {
            micro_workers = 5;
            macro_workers = 10;
            bizarre_retry = 5;
          };
        };
        theme = {
          filetype = {
            rules = [
              {
                fg = "#cdd6f4";
                name = "*";
              }
              {
                fg = "#89b4fa";
                name = "*/";
              }
              {
                fg = "#94e2d5";
                mime = "image/*";
              }
              {
                fg = "#f9e2af";
                mime = "{audio,video}/*";
              }
              {
                fg = "#f5c2e7";
                mime = "application/{zip,rar,7z*,tar,gzip,xz,zstd,bzip*,lzma,compress,archive,cpio,arj,xar,ms-cab*}";
              }
              {
                fg = "#a6e3a1";
                mime = "application/{pdf,doc,rtf}";
              }
            ];
          };
        };
      };
    };
  };
}
