{
  description = "A very basic flake";

  inputs = {
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-stable,
    home-manager,
    plasma-manager,
    ...
  } @ inputs: let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
    username = "sahan";
    system = "x86_64-linux";
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        /*
           unstable = import nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };
        */
        inherit inputs;
      };
      modules = [
        ./configuration.nix

        {
          nixpkgs.overlays = [
            (final: prev: {
              # unstable = nixpkgs-unstable.legacyPackages.${prev.system};
              # use this variant if unfree packages are needed:
              unstable = import nixpkgs-stable {
                inherit system;
                config.allowUnfree = true;
              };
            })
          ];
        }

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.sharedModules = [plasma-manager.homeManagerModules.plasma-manager];
          home-manager.users.sahan = import ./home-manager.nix;
        }
      ];
    };
  };
}
