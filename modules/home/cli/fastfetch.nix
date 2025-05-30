{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.mods.cli.fastfetch;
in {
  options.mods.cli.fastfetch.enable = mkEnableOption "enable funny fastfetch";
  config = mkIf cfg.enable {
    programs = {
      fastfetch = {
        enable = true;
        settings = {
          display = {
            color = {
              keys = "35";
              output = "80";
            };
          };
          logo = {
            #          source = ./nixos.png;
            #          type = "kitty-direct";
            height = 4;
            width = 8;
            # padding = {
            #   top = 1;
            #   left = 1;
            # };
          };
          modules = [
            "break"
            {
              type = "custom";
              format = "┌──────────────────────Hardware──────────────────────┐";
            }
            {
              type = "cpu";
              key = "│  ";
            }
            {
              type = "gpu";
              key = "│ 󰍛 ";
            }
            {
              type = "memory";
              key = "│ 󰑭 ";
            }
            {
              type = "custom";
              format = "└────────────────────────────────────────────────────┘";
            }
            "break"
            {
              type = "custom";
              format = "┌──────────────────────Software──────────────────────┐";
            }
            {
              type = "custom";
              format = " OS -> MaMotOS 1.0";
            }
            {
              type = "kernel";
              key = "│ ├ ";
            }
            {
              type = "packages";
              key = "│ ├󰏖 ";
            }
            {
              type = "shell";
              key = "└ └ ";
            }
            "break"
            {
              type = "wm";
              key = " WM";
            }
            {
              type = "wmtheme";
              key = "│ ├󰉼 ";
            }
            {
              type = "terminal";
              key = "└ └ ";
            }
            {
              type = "custom";
              format = "└────────────────────────────────────────────────────┘";
            }
            "break"
            {
              type = "custom";
              format = "┌────────────────────Uptime──────────────────────────┐";
            }
            {
              type = "command";
              key = "│  ";
              text =
                #bash
                ''
                  birth_install=$(stat -c %W /)
                  current=$(date +%s)
                  delta=$((current - birth_install))
                  delta_days=$((delta / 86400))
                  echo $delta_days days
                '';
            }
            {
              type = "uptime";
              key = "│  ";
            }
            {
              type = "custom";
              format = "└────────────────────────────────────────────────────┘";
            }
            "break"
          ];
        };
      };
    };
  };
}
