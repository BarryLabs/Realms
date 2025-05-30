{
  imports = [
    ./home-env.nix
    ../../modules/home
  ];
  mods = {
    wm = {
      wayland = {
        hyprland = {
          yggdrasil.enable = true;
        };
      };
    };
    terminal = {
      foot.enable = false;
      ghostty.enable = true;
      kitty.enable = false;
      wezterm.enable = false;
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
    fonts = {
      default.enable = true;
    };
    tools = {
      btop.enable = true;
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
