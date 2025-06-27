{
  pkgs,
  config,
  ...
}: {
  programs = {
    home-manager = {
      enable = true;
    };
  };
  home = {
    username = "mamotdask";
    homeDirectory = "/home/mamotdask";
    stateVersion = "24.11";
    enableNixpkgsReleaseCheck = false;
    sessionVariables = {
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
      fd
      jq
      socat
      keepassxc
      wine-wayland
      vesktop
      runelite
      usbutils
      hyprpicker
      wl-clipboard
      blender
      gimp
      libreoffice
      tor-browser
      bluetui
      deluge
      grim
      slurp
      swappy
      mpvpaper
      ardour
      jellyfin-media-player
    ];
  };
}
