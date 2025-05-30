{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.mods.wm.wayland.hyprland;
in {
  options.mods.wm.wayland.hyprland.enable = mkEnableOption "enable hyprland";
  config = mkIf cfg.enable {
    wayland = {
      windowManager = {
        hyprland = let
          initScript = pkgs.pkgs.writeShellScriptBin "start" ''
            ${pkgs.wpaperd}/bin/wpaperd &
            #~/.config/eww/scripts/init &
            ${pkgs.waybar}/bin/waybar &
          '';
        in {
          enable = true;
          package = null;
          portalPackage = null;
          extraConfig = ''

            monitor = eDP-1, 1920x1080@144, 0x0, 1

            input {
              numlock_by_default = true
            }

            general {
              gaps_in = 4
              gaps_out = 7,8,8,8
              border_size = 1
              layout = dwindle
              allow_tearing = false
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
            }

            animations {
              bezier = overshot, 0.15, 1, 0.3, 1.1
              bezier = windows, 0.05, 1, 0.3, 1
              animation = layers, 1, 6, overshot, fade
              animation = windows, 1, 8, windows
              animation = border, 1, 10, default
              animation = fade, 1, 6, default
              animation = workspaces, 1, 6, overshot, slidefadevert 80%
            }

              # Window Rules
            windowrulev2 = opacity 0.85 0.85, class:^(kitty)$
            windowrulev2 = opacity 0.90 0.90, floating:1
            windowrulev2 = bordercolor rgb(00FF00), fullscreenstate:* 1

          '';
          settings = {
            exec-once = ''${initScript}/bin/start'';
            "$mod" = "SUPER";
            bind = [
              # Window Management
              "$mod SHIFT, Q, exit"
              "$mod, Q, killactive"
              "$mod, F, fullscreen"
              "$mod, X, exec, hyprctl kill"
              "$mod, Space, togglefloating"
              # Apps
              "$mod, RETURN, exec, kitty"
              "$mod, B, exec, qutebrowser"
              "$mod, V, exec, blender"
              "$mod, I, exec, gimp"
              "$mod, C, exec, hyprpicker"
              "$mod, G, exec, screenshot"
              "$mod, M, exec, rofi-launcher"
              # Movement
              "$mod SHIFT, left, movewindow, l"
              "$mod SHIFT, right, movewindow, r"
              "$mod SHIFT, up, movewindow, u"
              "$mod SHIFT, down, movewindow, d"
              # Resize
              "$mod CTRL, left, resizeactive, -20 0"
              "$mod CTRL, right, resizeactive, 20 0"
              "$mod CTRL, up, resizeactive, 0 -20"
              "$mod CTRL, down, resizeactive, 0 20"
              "$mod, mouse_down, workspace, e+1"
              "$mod, mouse_up, workspace, e-1"
              # Focus
              "$mod, h, movefocus, l"
              "$mod, l, movefocus, r"
              "$mod, k, movefocus, u"
              "$mod, j, movefocus, d"
              # Workspace Management
              # Workspaces
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
              # Movement
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
              # Window Controls
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
  };
}
