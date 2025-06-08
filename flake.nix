{
    description = "jumanji flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        # chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
        # chaotic.url = "https://flakehub.com/f/chaotic-cx/nyx/*.tar.gz";
        impermanence.url = "github:nix-community/impermanence";
        stylix.url = "github:danth/stylix";
        zen-browser = {
            url = "github:youwen5/zen-browser-flake";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        ayugram-desktop = {
            type = "git";
            submodules = true;
            url = "https://github.com/ndfined-crp/ayugram-desktop/";
        };
    };

    outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
        system = "x86_64-linux";
    in {
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
            inherit system;
            specialArgs = {
                inherit inputs;
            };
            modules = [
                ./configuration.nix
                # inputs.chaotic.nixosModules.nyx-cache
                # inputs.chaotic.nixosModules.nyx-overlay
                # inputs.chaotic.nixosModules.nyx-registry
                inputs.stylix.nixosModules.stylix
                home-manager.nixosModules.home-manager {
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;
                    home-manager.backupFileExtension = "backup";
                    home-manager.extraSpecialArgs = { inherit inputs system; };
                    home-manager.users.jumanji = import ./home.nix;
                }
            ];
        };
    };
}
