{
  imports = [
    ./home-env.nix
    ../../modules/home
  ];
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
      foot.enable = true;
      ghostty.enable = false;
      kitty.enable = true;
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
      thefuck.enable = true;
      zellij.enable = true;
      zoxide.enable = true;
      zsh.enable = true;
    };
    browser = {
      chromium.enable = false;
      firefox.enable = false;
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
