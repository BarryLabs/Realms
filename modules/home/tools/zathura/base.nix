{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.mods.tools.zathura.base;
in {
  options.mods.tools.zathura.base.enable = mkEnableOption "enable base zathura module";
  config = mkIf cfg.enable {
    programs = {
      zathura = {
        enable = true;
        mappings = {
          K = "zoom in";
          J = "zoom out";
          r = "reload";
          R = "rotate";
          u = "scroll half-up";
          d = "scroll half-down";
          D = "toggle_page_mode";
          i = "recolor";
          H = "navigate previous";
          L = "navigate next";
          "<Right>" = "navigate next";
          "<Left>" = "navigate previous";
          "<Down>" = "scroll down";
          "<Up>" = "scroll up";
        };
        options = {
          font = "JetBrainsMono 14";
          adjust-open = "width";
          pages-per-row = 1;
          selection-clipboard = "clipboard";
          incremental-search = true;
          window-title-home-tilde = true;
          window-title-basename = true;
          statusbar-home-tilde = true;
          show-hidden = true;
          statusbar-h-padding = 0;
          statusbar-v-padding = 0;
          page-padding = 1;

          notification-error-bg = "#282828";
          notification-error-fg = "#fb4934";
          notification-warning-bg = "#282828";
          notification-warning-fg = "#fabd2f";
          notification-bg = "#282828";
          notification-fg = "#b8bb26";
          completion-bg = "#504945";
          completion-fg = "#ebdbb2";
          completion-group-bg = "#3c3836";
          completion-group-fg = "#928374";
          completion-highlight-bg = "#83a598";
          completion-highlight-fg = "#504945";
          index-bg = "#504945";
          index-fg = "#ebdbb2";
          index-active-bg = "#83a598";
          index-active-fg = "#504945";
          inputbar-bg = "#282828";
          inputbar-fg = "#ebdbb2";
          statusbar-bg = "#504945";
          statusbar-fg = "#ebdbb2";
          highlight-color = "#f9e2af";
          highlight-active-color = "#fe8019";
          default-bg = "#282828";
          default-fg = "#ebdbb2";
          render-loading = true;
          render-loading-bg = "#282828";
          render-loading-fg = "#ebdbb2";
          recolor-lightcolor = "#282828";
          recolor-darkcolor = "#ebdbb2";
          recolor-keephue = true;
        };
      };
    };
  };
}
