<div align="center">

# Realms (Alpha)

## Abyss

<img align="center" width="90%" src="https://github.com/BarryLabs/Realms/blob/main/common/abyss-desktop-1.png" />
<img align="center" width="90%" src="https://github.com/BarryLabs/Realms/blob/main/common/abyss-desktop-2.png" />

## Yggdrasil

<img align="center" width="90%" src="https://github.com/BarryLabs/Realms/blob/main/common/yggdrasil-desktop-1.png" />

</div>

# Abstract

Realms aims to automate and reduce the operational footprint of my lab with a
few goals in mind;

1. Minimize proprietary software.
2. Minimize time to deploy.
3. Maximize pre-configured linux hardening.

Each machine handles all firmware with the current exception of _abyss_* and
module is quite malleable and can be used easily in any type of configuration
allowing a number of benefits including packaging my preferred configurations as
well as packaging entire servers to ease management and general use.

The product is to be a repository containing basic system modules, my preferred
environment as customized programs and services as well as fully configured
machines for a number of different tasks. This project should then also allow a
simple format to quickly customize like-systems and build new machines while
maintaining the best security posture possible.

Many of these machines are servers highlighted in the table below however my
workflow exists in my daily drivers _Abyss_ and _Yggdrasil_.

- This repo is a trimmed version of my local repo omitting files in the
  `.gitignore`. As such, secrets, automated backups and utility from OCI
  containers are not yet included. Any issues can more than likely be addressed
  quickly manually before I fix them directly.

- This repo is currently subject to heavy changes.

## Roadmap
<div align="center">
In no specific order;
</div>

- Fix all the gitignored files.
- Add proper Derivation/Overlay support.
- Allow easy creation of VM's and ISO's.
- Fix icons in some applications.
- Finalize Neovim configuration.
- Fix Gamemode?
- Finalize base modules.
- Modularize everything possible.

## Workflow

- **Window Manager**: hyprland
- **Wallpaper**: wpaperd/mpvpaper
- **Logout**: wlogout
- **Notifications**: eww/dunst
- **Bar**: eww/waybar
- **Terminal**: ghostty/kitty/wezterm/foot
- **Multiplexer**: zellij/tmux | ghostty/kitty/wezterm
- **Shell**: nushell/zsh/bash
- **VCS**: jujutsu/git
- **Editor**: nvim/emacs/nano
- **Notes**: neorg
- **File Browser**: yazi/ranger
- **Reader**: zathura
- **System Usage**: btop/htop
- **Browser**: qutebrowser/firefox/zen
- **Email**: thunderbird
- **Recording/Streaming**: obs/grim/slurp
- **Audio Effects**: easyeffects
- **Audio Development**: ardour
- **Video**: mpv
- **Blender**: blender
- **AI**: ollama
- **Virtualisation**: podman/kvm
- **Gaming**: lutris/steam
- **FPS**: mangohud
- **Game Streaming**: sunshine/steam
- **VR**: ALVR
- **Automation**: n8n
- **File Sync**: syncthing/nfs/smb
- **Backup**: borg

### Additional Tools

- bat
- eza
- cava
- fzf
- pidgin
- tealdeer
- thefuck
- zoxide

## Usage

### Table of Hosts

| Host        | Aegir        | Asgard       | Heimskringla | Hel              | Tesseract    | Abyss              | Yggdrasil     |
| ----------- | ------------ | ------------ | ------------ | ---------------- | ------------ | ------------------ | ------------- |
| Description | Media        | NAS          | Monitor      | Security Testing | Minecraft    | Laptop             | Workstation   |
| CPU (Cores) | i5-8500T (2) | i5-8500T (4) | i5-6500T (2) | VM               | i5-6500T (2) | i7-9750H (12)      | R9 3900X (24) |
| GPU         | UHD 630      | UHD 630      | /            | VM               | /            | UHD 630,GTX 1660Ti | RTX 3080      |
| RAM         | 8GB DDR4     | 30GB DDR4    | 2GB DDR4     | VM               | 8GB DDR4     | 32GB DDR4          | 128GB DDR4    |
| Network     | 2.5GB/s      | 1GB/s        | 1GB/s        | VM               | 1GB/s        | Intel 9560 AC      | 2.5GB/s       |
| Host Disk   | 64GB M.2     | 2TB SATA SSD | 32GB M.2     | VM               | 64GB         | 1TB M.2            | 1TB M.2       |
| Extra Disks | 5TB HDD      | 16TB Mirror  | /            | /                | /            | 2TB SATA SSD       | 1TB M.2       |

### Installation

#### NixOS-Anywhere

1. Burn the Gnome ISO to a removable disk and boot into it.
2. Change password with `passwd`.
3. Be sure to check through the configuration to ensure desired configuration is
   achieved and putting in your own SSH key so you don't get locked out of your
   machine.
4. Use
   `nix run github:nix-community/nixos-anywhere -- --flake <path to flake>#<host> --target-host nixos@<ip address>`
   from the remote machine when you have finished making your changes.
5. Configure the services to run how you want them to.

#### Installation Script

The install.sh script should be used if not using nixos-anywhere to install a
given machine. You must install NixOS first and then run the installation
script.
