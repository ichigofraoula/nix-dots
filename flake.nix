{
  description = "first flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    
    #nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixos-hardware, home-manager, zen-browser, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations = {
        strize = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ 
            ./configuration.nix 
            ./config/niri.nix
            {
              inputs = inputs;
              username = "strize";
            }
            #nixos-hardware.nixosModules.apple-macbook-air-7
          ];
        };
      };

      homeConfigurations = {
        strize-home = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ 
            ./home.nix
            ./home/fastfetch.nix
            ./home/tmux.nix
          ];
          extraSpecialArgs = { inherit inputs; };
        };
      };
    };
}

