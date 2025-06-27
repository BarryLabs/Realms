{pkgs, ...}: {
  programs = {
    home-manager = {
      enable = true;
    };
  };
  home = {
    username = "chandler";
    homeDirectory = "/home/chandler";
    stateVersion = "24.11";
    enableNixpkgsReleaseCheck = false;
    sessionVariables = {
      EDITOR = "nvim";
			DISPLAY = ":0";
      NIXOS_OZONE_WL = 1;
      WAYLAND_DISPLAY = "wayland-1";
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
    };
    packages = with pkgs; [
      (lutris.override {
        extraPkgs = pkgs: [
          adwaita-icon-theme
        ];
      })
      jq
      socat
      grim
      slurp
      swappy
      usbutils
      mpvpaper
      hyprpicker
      wine-wayland
      wl-clipboard
      gimp
      ardour
      blender
      keepassxc
      discord-screenaudio
      runelite
      libreoffice
      monero-gui
      tor-browser
    ];
  };
}
