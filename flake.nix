{
    description = "jumanji flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        stylix.url = "github:danth/stylix";
        # hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
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
        # overlays = [
        #     inputs.hyprpanel.overlay
        # ];
    in {
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
            inherit system;
            specialArgs = {
                inherit inputs;
            };
            modules = [
                ./configuration.nix
                inputs.stylix.nixosModules.stylix
                home-manager.nixosModules.home-manager {
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;
                    home-manager.backupFileExtension = "backup";
                    home-manager.extraSpecialArgs = { inherit inputs system; };
                    home-manager.users.jumanji = import ./home.nix;
                }
                # {
                #     nixpkgs.overlays = overlays;
                # }
            ];
        };
    };
}
