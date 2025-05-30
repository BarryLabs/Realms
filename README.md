<div align="center">

# Realms

</div>

## Abstract

I had but a few goals in mind;

1. Minimize proprietary software.
2. Minimize time to deploy.
3. Maximize pre-configured linux hardening.

Each configuration is placed within the direct configuration while base modules
exist in a structure to maintain similar structure to nixpkgs. I have also
created a subset of modules under "augs" for system modules and "mods" for
home-manager modules.

## Usage

### Table of Hosts

| Host        | Aegir        | Asgard       | Cerebro      | Abyss              | Tower         |
| ----------- | ------------ | ------------ | ------------ | ------------------ | ------------- |
| Description | Media        | NAS          | Monitor      | Laptop             | Workstation   |
| CPU (Cores) | i5-8500T (2) | i5-8500T (4) | i5-6500T (2) | i7-9750H (12)      | R9 3900X (24) |
| GPU         | UHD 630      | UHD 630      | /            | UHD 630,GTX 1660Ti | RTX 3080      |
| RAM         | 8GB DDR4     | 30GB DDR4    | 2GB DDR4     | 32GB DDR4          | 128GB DDR4    |
| Network     | 2.5GB/s      | 1GB/s        | 1GB/s        | Intel 9560 AC      | 2.5GB/s       |
| Host Disk   | 64GB M.2     | 2TB SATA SSD | 32GB M.2     | 1TB M.2            | 1TB M.2       |
| Extra Disks | 5TB HDD      | 16TB Mirror  | /            | 2TB SATA SSD       | 1TB M.2       |

### Installation

All machines 'should' be configured to be installed with nixos-anywhere however
the reason I put it like this is because since I have consolidated the modules
in this repo, I have experienced an error claiming that there exists no build
script for a defined configuration despite the configuration existing. For this
reason an installation script as well as a guide below will offer the resources
necessary to utilize this repo. I have no idea whats going on here currently
however the solution is difficult because we are targeting our disks using disko
versus manually. We need to use disko to handle the disks first to which we can
then build our default.nix to enable flakes before rebuilding **with** flakes.
The installation script handles this for now.

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
given machine. Simply
