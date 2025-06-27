{pkgs, ...}: {
  imports = [
    ./home-env.nix
    ../../modules/home
  ];
  services = {
    wpaperd = {
      settings = {
        eDP-1 = {
          path = "/etc/nixos/.config/wallpapers/treepond_colors.png";
          apply-shadow = true;
        };
      };
    };
  };
  wayland = {
    windowManager = {
      hyprland = let
        init = pkgs.pkgs.writeShellScriptBin "init" ''
          ${pkgs.wpaperd}/bin/wpaperd &
          ${pkgs.hypridle}/bin/hypridle &
          ${pkgs.waybar}/bin/waybar &
          ${pkgs.wl-clipboard}/bin/wl-paste --type text --watch cliphist store &
          ${pkgs.wl-clipboard}/bin/wl-paste --type image --watch cliphist store &
        '';
      in {
        settings = {
          monitor = [
            ",preferred,auto,1"
          ];
        };
      };
    };
  };
  mods = {
    wm = {
      wayland = {
        dunst.enable = true;
        eww.enable = false;
        hypridle.enable = true;
        hyprland.enable = true;
        hyprlock.enable = true;
        rofi.enable = true;
        waybar.enable = true;
        wlogout.enable = true;
        wlsunset.enable = true;
        wpaperd.enable = true;
      };
    };
    terminal = {
      foot.enable = false;
      ghostty.enable = false;
      kitty.enable = true;
      wezterm.enable = false
    };
    cli = {
      bat.enable = true;
      cava.enable = true;
      eza.enable = true;
      fastfetch.enable = true;
      fzf.enable = true;
      git.enable = true;
      jujutsu.enable = true;
      nvf.enable = true;
      starship.enable = true;
      tealdeer.enable = true;
      zellij.enable = true;
      zoxide.enable = true;
      zsh.enable = true;
    };
    browser = {
      chromium.enable = false;
      firefox.enable = true;
      qutebrowser.enable = true;
    };
    files = {
      ranger.enable = false;
      yazi.enable = true;
    };
    tools = {
      btop.enable = true;
      mangohud.enable = true;
      mpv.enable = true;
      obs.enable = true;
      ollama.enable = false;
      pidgin.enable = false;
      podman.enable = true;
      thunderbird.enable = true;
      zathura.enable = true;
    };
  };
}
