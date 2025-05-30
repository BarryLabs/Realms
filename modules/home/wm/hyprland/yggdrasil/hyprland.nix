{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.mods.wm.wayland.hyprland.yggdrasil;
in {
  options.mods.wm.wayland.hyprland.yggdrasil.enable = mkEnableOption "enable tower's hyprland configuration";
  config = mkIf cfg.enable {
    services = {
      dunst = {
        enable = true;
        settings = {
          global = {
            browser = "${pkgs.qutebrowser}/bin/qutebrowser";
            dmenu = "${pkgs.rofi}/bin/rofi -dmenu";
            corner_radius = 6;
            follow = "mouse";
            font = "Source Code Pro 10";
            format = "<b>%s</b>\\n%b";
            frame_color = "#89b4fa";
            frame_width = 2;
            geometry = "300x5-5+30";
            horizontal_padding = 8;
            highlight = "#89b4fa";
            icon_position = "off";
            indicate_hidden = "yes";
            line_height = 0;
            markup = "full";
            mouse_left_click = "do_action";
            mouse_middle_click = "close_all";
            mouse_right_click = "close_current";
            padding = 8;
            progress_bar = true;
            separator_color = "frame";
            separator_height = 2;
            show_indicators = "yes";
            sort = "yes";
            transparency = 10;
            word_wrap = true;
          };
          urgency_low = {
            background = "#1e1e2e";
            foreground = "#cdd6f4";
            timeout = 10;
          };
          urgency_normal = {
            background = "#1e1e2e";
            foreground = "#cdd6f4";
            timeout = 15;
          };
          urgency_critical = {
            background = "#1e1e2e";
            foreground = "#cdd6f4";
            frame_color = "#fab387";
            timeout = 0;
          };
        };
      };
    };
    programs = {
      eww = {
        enable = true;
        enableZshIntegration = true;
        configDir = ../../../../../.config/eww/yggdrasil;
      };
    };
    services = {
      hypridle = {
        settings = {
          general = {
            after_sleep_cmd = "hyprctl dispatch dpms on";
            ignore_dbus_inhibit = false;
            lock_cmd = "hyprlock";
          };
          listener = [
            {
              timeout = 900;
              on-timeout = "hyprlock";
            }
            {
              timeout = 1200;
              on-timeout = "hyprctl dispatch dpms off";
              on-resume = "hyprctl dispatch dpms on";
            }
          ];
        };
      };
    };
    wayland = {
      windowManager = {
        hyprland = let
          initScript = pkgs.pkgs.writeShellScriptBin "start" ''
            ${pkgs.wpaperd}/bin/wpaperd &
            ~/.config/eww/scripts/init &
          '';
        in {
          enable = true;
          package = null;
          portalPackage = null;
          extraConfig = ''

            monitor = HDMI-A-2, 1920x1080@144, 0x0, 1
            monitor = HDMI-A-1, 2560x1080@165, 1920x0, 1

            general {
              gaps_in = 6
              gaps_out = 8
              border_size = 2
              allow_tearing = false
            }

            input {
              numlock_by_default = true
            }

            misc {
              disable_hyprland_logo = true
              disable_splash_rendering = true
            }

            ecosystem {
              no_update_news = false
              no_donation_nag = true
            }

            decoration {
              rounding = 6
              blur {
                enabled = false
                size = 2
                passes = 2
                vibrancy = 0
                contrast = 1
                brightness = 1
                noise = 0.02
                special = true
              }
              shadow {
                enabled = false
              }
            }

            animations {
              bezier = overshot, 0.83, 0, 0.17, 1
              bezier = windows, 0.68, -0.6, 0.32, 1.6
              animation = layers, 1, 6, overshot, fade
              animation = windows, 1, 8, windows
              animation = border, 1, 10, default
              animation = fade, 1, 6, default
              animation = workspaces, 1, 6, overshot, slidefadevert 80%
            }

            misc {
              disable_hyprland_logo = true
              disable_splash_rendering = true
            }

            windowrulev2 = opacity 0.85 0.85, class:^(kitty)$
            windowrulev2 = opacity 0.85 0.85, class:^(ghostty)$
            windowrulev2 = opacity 0.95 0.95, floating:1
            windowrulev2 = bordercolor rgb(00FF00), fullscreenstate:* 1

          '';
          settings = {
            exec-once = ''${initScript}/bin/start'';
            "$mod" = "SUPER";
            bind = [
              "$mod SHIFT, Q, exit"
              "$mod, Q, killactive"
              "$mod, F, fullscreen"
              "$mod, X, exec, hyprctl kill"
              "$mod, Space, togglefloating"
              "$mod, RETURN, exec, ghostty"
              "$mod, B, exec, qutebrowser"
              "$mod, V, exec, blender"
              "$mod, I, exec, gimp"
              "$mod, C, exec, hyprpicker"
              "$mod, G, exec, screenshot"
              "$mod, M, exec, rofi-launcher"
              "$mod SHIFT, left, movewindow, l"
              "$mod SHIFT, right, movewindow, r"
              "$mod SHIFT, up, movewindow, u"
              "$mod SHIFT, down, movewindow, d"
              "$mod CTRL, left, resizeactive, -20 0"
              "$mod CTRL, right, resizeactive, 20 0"
              "$mod CTRL, up, resizeactive, 0 -20"
              "$mod CTRL, down, resizeactive, 0 20"
              "$mod, mouse_down, workspace, e+1"
              "$mod, mouse_up, workspace, e-1"
              "$mod, h, movefocus, l"
              "$mod, l, movefocus, r"
              "$mod, k, movefocus, u"
              "$mod, j, movefocus, d"
              "$mod, 1, workspace, 1"
              "$mod, 2, workspace, 2"
              "$mod, 3, workspace, 3"
              "$mod, 4, workspace, 4"
              "$mod, 5, workspace, 5"
              "$mod, 6, workspace, 6"
              "$mod, 7, workspace, 7"
              "$mod, 8, workspace, 8"
              "$mod, 9, workspace, 9"
              "$mod ALT, up, workspace, e+1"
              "$mod ALT, down, workspace, e-1"
              "$mod SHIFT, 1, movetoworkspace, 1"
              "$mod SHIFT, 2, movetoworkspace, 2"
              "$mod SHIFT, 3, movetoworkspace, 3"
              "$mod SHIFT, 4, movetoworkspace, 4"
              "$mod SHIFT, 5, movetoworkspace, 5"
              "$mod SHIFT, 6, movetoworkspace, 6"
              "$mod SHIFT, 7, movetoworkspace, 7"
              "$mod SHIFT, 8, movetoworkspace, 8"
              "$mod SHIFT, 9, movetoworkspace, 9"
            ];
            bindm = [
              "$mod, mouse:272, movewindow"
              "$mod, mouse:273, resizewindow"
            ];
          };
          plugins = with pkgs.hyprlandPlugins; [
            hyprgrass
            borders-plus-plus
            hypr-dynamic-cursors
          ];
        };
      };
    };
    programs = {
      hyprlock = {
        enable = true;
        settings = {
          general = {
            disable_loading_bar = true;
            grace = 10;
            hide_cursor = true;
            no_fade_in = false;
          };
          background = [
            {
              blur_size = 6;
              blur_passes = 3;
              path = "../../../../../.config/wallpapers/treepond_colors.png";
            }
          ];
          image = [
            {
              path = "../../../../../.config/wallpapers/cat_wall.png";
              size = 150;
              border_size = 4;
              border_color = "rgb(0C96F9)";
              rounding = -1;
              position = "0, 200";
              halign = "center";
              valign = "center";
            }
          ];
          input-field = [
            {
              size = "200, 50";
              position = "0, -80";
              monitor = "";
              dots_center = true;
              fade_on_empty = false;
              font_color = "rgb(CFE6F4)";
              inner_color = "rgb(657DC2)";
              outer_color = "rgb(0D0E15)";
              outline_thickness = 5;
              placeholder_text = "Password...";
              shadow_passes = 2;
            }
          ];
        };
      };
    };
    programs = {
      rofi = {
        enable = true;
        package = pkgs.rofi-wayland;
        extraConfig = {
          modi = "drun,filebrowser,run";
          show-icons = true;
          icon-theme = "Papirus";
          location = 0;
          font = "Source Code Pro 12";
          drun-display-format = "{icon} {name}";
          display-drun = " Apps";
          display-run = " Run";
          display-filebrowser = " File";
        };
        theme = let
          inherit (config.lib.formats.rasi) mkLiteral;
        in {
          "*" = {
            bg = mkLiteral "#262c5e";
            bg-alt = mkLiteral "#acb0be";
            foreground = mkLiteral "#6c7086";
            selected = mkLiteral "#40a02b";
            active = mkLiteral "#04a5e5";
            text-selected = mkLiteral "#4c4f69";
            text-color = mkLiteral "#ffffff";
            border-color = mkLiteral "#179299";
            urgent = mkLiteral "#e64553";
          };
          "window" = {
            width = mkLiteral "50%";
            transparency = "real";
            orientation = mkLiteral "vertical";
            cursor = mkLiteral "default";
            spacing = mkLiteral "0px";
            border = mkLiteral "2px";
            border-color = "@border-color";
            border-radius = mkLiteral "20px";
            background-color = mkLiteral "@bg";
          };
          "mainbox" = {
            padding = mkLiteral "15px";
            enabled = true;
            orientation = mkLiteral "vertical";
            children = map mkLiteral [
              "inputbar"
              "listbox"
            ];
            background-color = mkLiteral "transparent";
          };
          "inputbar" = {
            enabled = true;
            padding = mkLiteral "10px 10px 10px 10px";
            margin = mkLiteral "10px";
            background-color = mkLiteral "transparent";
            border-radius = "25px";
            orientation = mkLiteral "horizontal";
            children = map mkLiteral [
              "entry"
              "dummy"
              "mode-switcher"
            ];
            #background-image = mkLiteral ''url("~/.system/Machines/Tower/.config/wallpapers/nature/bright_tree.png", width)'';
          };
          "entry" = {
            enabled = true;
            expand = false;
            width = mkLiteral "20%";
            padding = mkLiteral "10px";
            border-radius = mkLiteral "12px";
            background-color = mkLiteral "@selected";
            text-color = mkLiteral "@text-selected";
            cursor = mkLiteral "text";
            placeholder = " Search ";
            placeholder-color = mkLiteral "inherit";
          };
          "listbox" = {
            spacing = mkLiteral "10px";
            padding = mkLiteral "10px";
            background-color = mkLiteral "transparent";
            orientation = mkLiteral "vertical";
            children = map mkLiteral [
              "message"
              "listview"
            ];
          };
          "listview" = {
            enabled = true;
            columns = 2;
            lines = 6;
            cycle = true;
            dynamic = true;
            scrollbar = false;
            layout = mkLiteral "vertical";
            reverse = false;
            fixed-height = false;
            fixed-columns = true;
            spacing = mkLiteral "10px";
            background-color = mkLiteral "transparent";
            border = mkLiteral "0px";
          };
          "dummy" = {
            expand = true;
            background-color = mkLiteral "transparent";
          };
          "mode-switcher" = {
            enabled = true;
            spacing = mkLiteral "10px";
            background-color = mkLiteral "transparent";
          };
          "button" = {
            width = mkLiteral "5%";
            padding = mkLiteral "12px";
            border-radius = mkLiteral "12px";
            background-color = mkLiteral "@text-selected";
            text-color = mkLiteral "@text-color";
            cursor = mkLiteral "pointer";
          };
          "button selected" = {
            background-color = mkLiteral "@selected";
            text-color = mkLiteral "@text-selected";
          };
          "scrollbar" = {
            width = mkLiteral "4px";
            border = 0;
            handle-color = mkLiteral "@border-color";
            handle-width = mkLiteral "8px";
            padding = 0;
          };
          "element" = {
            enabled = true;
            spacing = mkLiteral "10px";
            padding = mkLiteral "10px";
            border-radius = mkLiteral "12px";
            background-color = mkLiteral "transparent";
            cursor = mkLiteral "pointer";
          };
          "element normal.normal" = {
            background-color = mkLiteral "inherit";
            text-color = mkLiteral "inherit";
          };
          "element normal.urgent" = {
            background-color = mkLiteral "@urgent";
            text-color = mkLiteral "@foreground";
          };
          "element normal.active" = {
            background-color = mkLiteral "@active";
            text-color = mkLiteral "@foreground";
          };
          "element selected.normal" = {
            background-color = mkLiteral "@selected";
            text-color = mkLiteral "@text-selected";
          };
          "element selected.urgent" = {
            background-color = mkLiteral "@urgent";
            text-color = mkLiteral "@text-selected";
          };
          "element selected.active" = {
            background-color = mkLiteral "@urgent";
            text-color = mkLiteral "@text-selected";
          };
          "element alternate.normal" = {
            background-color = mkLiteral "transparent";
            text-color = mkLiteral "inherit";
          };
          "element alternate.urgent" = {
            background-color = mkLiteral "transparent";
            text-color = mkLiteral "inherit";
          };
          "element alternate.active" = {
            background-color = mkLiteral "transparent";
            text-color = mkLiteral "inherit";
          };
          "element-icon" = {
            background-color = mkLiteral "transparent";
            text-color = mkLiteral "inherit";
            size = mkLiteral "28px";
            cursor = mkLiteral "inherit";
          };
          "element-text" = {
            background-color = mkLiteral "transparent";
            font = "Source Code Pro 12";
            text-color = mkLiteral "inherit";
            cursor = mkLiteral "inherit";
            vertical-align = mkLiteral "0.5";
            horizontal-align = mkLiteral "0.0";
          };
          "message" = {
            background-color = mkLiteral "transparent";
            border = mkLiteral "0px";
          };
          "textbox" = {
            padding = mkLiteral "12px";
            border-radius = mkLiteral "10px";
            background-color = mkLiteral "@bg-alt";
            text-color = mkLiteral "@bg";
            vertical-align = mkLiteral "0.5";
            horizontal-align = mkLiteral "0.0";
          };
          "error-message" = {
            padding = mkLiteral "12px";
            border-radius = mkLiteral "20px";
            background-color = mkLiteral "@bg-alt";
            text-color = mkLiteral "@bg";
          };
        };
      };
    };
    services = {
      wlsunset = {
        enable = true;
        sunrise = "06:00";
        sunset = "21:00";
        temperature = {
          day = 2800;
          night = 2700;
        };
      };
    };
    programs = {
      wlogout = {
        enable = true;
        layout = [
          {
            label = "shutdown";
            action = "sleep 1; systemctl poweroff";
            text = "Shutdown";
            keybind = "s";
          }
          {
            "label" = "reboot";
            "action" = "sleep 1; systemctl reboot";
            "text" = "Reboot";
            "keybind" = "r";
          }
          {
            "label" = "logout";
            "action" = "sleep 1; hyprctl dispatch exit";
            "text" = "Exit";
            "keybind" = "e";
          }
          {
            "label" = "suspend";
            "action" = "sleep 1; systemctl suspend";
            "text" = "Suspend";
            "keybind" = "u";
          }
          {
            "label" = "lock";
            "action" = "sleep 1; hyprlock";
            "text" = "Lock";
            "keybind" = "l";
          }
          {
            "label" = "hibernate";
            "action" = "sleep 1; systemctl hibernate";
            "text" = "Hibernate";
            "keybind" = "h";
          }
        ];
        style = ''
           * {
            background-image: none;
            box-shadow: none;
           }
           window {
             background-color: rgba(30, 30, 46, 0.90);
           }
           button {
          border-radius: 0;
          border-color: #fab387;
          text-decoration-color: #cdd6f4;
          color: #cdd6f4;
          background-color: #181825;
          border-style: solid;
          border-width: 1px;
          background-repeat: no-repeat;
          background-position: center;
          background-size: 25%;
           }
           button:focus,
           button:active,
           button:hover {
             background-color: rgb(48, 50, 66);
             outline-style: none;
           }
           #logout {
            margin: 10px;
            border-radius: 20px;
             background-image: url("/etc/nixos/.config/wlogout/logout.png");
           }
           #suspend {
            margin: 10px;
            border-radius: 20px;
             background-image: url("/etc/nixos/.config/wlogout/suspend.png");
           }
           #shutdown {
            margin: 10px;
            border-radius: 20px;
             background-image: url("/etc/nixos/.config/wlogout/shutdown.png");
           }
           #reboot {
            margin: 10px;
            border-radius: 20px;
             background-image: url("/etc/nixos/.config/wlogout/reboot.png");
           }
           #lock {
            margin: 10px;
            border-radius: 20px;
             background-image: url("/etc/nixos/.config/wlogout/lock.png");
           }
           #hibernate {
            margin: 10px;
            border-radius: 20px;
             background-image: url("/etc/nixos/.config/wlogout/hibernate.png");
           }
        '';
      };
    };
    services = {
      wpaperd = {
        enable = true;
        settings = {
          HDMI-A-1 = {
            path = "/etc/nixos/.config/wallpapers/treepond_colors.png";
            apply-shadow = true;
          };
          HDMI-A-2 = {
            path = "/etc/nixos/.config/wallpapers/cat_wall.jpeg";
            apply-shadow = true;
          };
        };
      };
    };
  };
}
