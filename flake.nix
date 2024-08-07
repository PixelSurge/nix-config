{
  description = "A very basic flake";

  inputs = {
   ## nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
   ## nixpkgs-unstable,
    home-manager,
    ...
  } @ inputs: let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
    system = "x86_64-linux";
  in {
     nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      /*specialArgs = {
        pkgs-stable = import nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        }; 
        inherit inputs;
      }; */
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.sahan = import ./home-manager.nix;
        }
      ];
    };
  };
}
