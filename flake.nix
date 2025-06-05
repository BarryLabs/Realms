{
  description = ''
    Realms

    Install pre-configured servers including my daily drivers
    or pull simple modules for your own configuration.
  '';

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs?ref=nixos-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-minecraft = {
      url = "github:Infinidoge/nix-minecraft";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    disko,
    sops-nix,
    nvf,
    nix-minecraft,
    ...
  }: let
    arch = {
      sysMob = "aarch64-linux";
      sys32 = "i686-linux";
      sys64 = "x86_64-linux";
      sysMac = "x86_64-darwin";
    };
  in {
    nixosConfigurations = {
      abyss = nixpkgs.lib.nixosSystem {
        system = arch.sys64;
        modules = [
          disko.nixosModules.disko
          sops-nix.nixosModules.sops
          home-manager.nixosModules.home-manager
          ./machines/abyss
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "backup";
              users.mamotdask = import ./machines/abyss/home.nix;
              extraSpecialArgs = {inherit inputs;};
            };
          }
        ];
      };
      yggdrasil = nixpkgs.lib.nixosSystem {
        system = arch.sys64;
        modules = [
          disko.nixosModules.disko
          sops-nix.nixosModules.sops
          home-manager.nixosModules.home-manager
          ./machines/yggdrasil
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "backup";
              users.chandler = import ./machines/yggdrasil/home.nix;
              extraSpecialArgs = {inherit inputs;};
            };
          }
        ];
      };
      aegir = nixpkgs.lib.nixosSystem {
        system = arch.sys64;
        specialArgs = {inherit inputs;};
        modules = [
          disko.nixosModules.disko
          sops-nix.nixosModules.sops
          ./machines/aegir
        ];
      };
      asgard = nixpkgs.lib.nixosSystem {
        system = arch.sys64;
        specialArgs = {inherit inputs;};
        modules = [
          disko.nixosModules.disko
          sops-nix.nixosModules.sops
          ./machines/asgard
        ];
      };
      bifrost = nixpkgs.lib.nixosSystem {
        system = arch.sys64;
        specialArgs = {inherit inputs;};
        modules = [
          disko.nixosModules.disko
          sops-nix.nixosModules.sops
          ./machines/bifrost
        ];
      };
      heimskringla = nixpkgs.lib.nixosSystem {
        system = arch.sys64;
        specialArgs = {inherit inputs;};
        modules = [
          disko.nixosModules.disko
          sops-nix.nixosModules.sops
          ./machines/heimskringla
        ];
      };
      hel = nixpkgs.lib.nixosSystem {
        system = arch.sys64;
        specialArgs = {inherit inputs;};
        modules = [
          disko.nixosModules.disko
          sops-nix.nixosModules.sops
          ./machines/hel
        ];
      };
      himinbjorg = nixpkgs.lib.nixosSystem {
        system = arch.sys64;
        specialArgs = {inherit inputs;};
        modules = [
          disko.nixosModules.disko
          sops-nix.nixosModules.sops
          ./machines/himinbjorg
        ];
      };
      mini-iso = nixpkgs.lib.nixosSystem {
        system = arch.sys64;
        specialArgs = {inherit inputs;};
        modules = [
          sops-nix.nixosModules.sops
          ./machines/mini-iso
        ];
      };
      mini-vm = nixpkgs.lib.nixosSystem {
        system = arch.sys64;
        specialArgs = {inherit inputs;};
        modules = [
          disko.nixosModules.disko
          sops-nix.nixosModules.sops
          ./machines/mini-vm
        ];
      };
      muspelheim = nixpkgs.lib.nixosSystem {
        system = arch.sys64;
        specialArgs = {inherit inputs;};
        modules = [
          disko.nixosModules.disko
          sops-nix.nixosModules.sops
          ./machines/muspelheim
        ];
      };
      tesseract = nixpkgs.lib.nixosSystem {
        system = arch.sys64;
        specialArgs = {inherit inputs;};
        modules = [
          disko.nixosModules.disko
          sops-nix.nixosModules.sops
          ./machines/tesseract
        ];
      };
      valaskjalf = nixpkgs.lib.nixosSystem {
        system = arch.sys64;
        specialArgs = {inherit inputs;};
        modules = [
          disko.nixosModules.disko
          sops-nix.nixosModules.sops
          ./machines/valaskjalf
        ];
      };
    };
  };
}
