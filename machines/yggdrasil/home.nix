{
  imports = [
    ./home-env.nix
    ../../modules/home
  ];
  mods = {
    wm = {
      wayland = {
        dunst.enable = true;
        eww.enable = true;
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
      foot.enable = true;
      ghostty.enable = true;
      kitty.enable = true;
      wezterm.enable = true;
    };
    cli = {
      bat.enable = true;
      cava.enable = true;
      eza.enable = false;
      fastfetch.enable = true;
      fzf.enable = true;
      git.enable = true;
      jujutsu.enable = true;
      nixvim.enable = true;
      nushell.enable = true;
      nvf.enable = false;
      starship.enable = true;
      tealdeer.enable = true;
      zellij.enable = true;
      zoxide.enable = true;
      # TODO; Convert shell scripts to nushell to turn off zsh.
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
    fonts = {
      default.enable = true;
    };
    tools = {
      btop.enable = true;
      easyeffects.enable = true;
      mangohud.enable = true;
      mpv.enable = true;
      obs.enable = true;
      ollama.enable = true;
      pidgin.enable = true;
      podman.enable = true;
      thunderbird.enable = true;
      zathura.enable = true;
    };
  };
}
