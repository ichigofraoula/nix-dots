{
  description = "first flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, zen-browser, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations = {
        strize = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ ./configuration.nix ];
        };
      };

      homeConfigurations = {
        strize-home = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home.nix ];
	  extraSpecialArgs = { inherit inputs; };
        };
      };
    };
}

