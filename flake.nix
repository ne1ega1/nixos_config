{
  description = "hanzo flake";

  inputs = {
    nvf.url = "github:NotAShelf/nvf/v0.8";
    stylix.url = "github:danth/stylix";
    hyprland.url = "github:hyprwm/Hyprland";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    impermanence.url = "github:nix-community/impermanence";
    yandex-music.url = "github:cucumber-sp/yandex-music-linux";
    ayugram-desktop.url = "github:ndfined-crp/ayugram-desktop";
    freesm.url = "github:freesmteam/freesmlauncher";
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixcord = {
      url = "github:kaylorben/nixcord";
    };
    yazi-office = {
      url = "github:macydnah/office.yazi";
      flake = false;
    };
    yazi-compress = {
      url = "github:kkv9/compress.yazi";
      flake = false;
    };
    yazi-size = {
      url = "github:pirafrank/what-size.yazi";
      flake = false;
    };
    yazi-clipboard = {
      url = "github:grappas/wl-clipboard.yazi";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    {
      nixosConfigurations = {
        hanzo = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
            overlays = [ ];
          };
          modules = [
            ./settings
            ./hosts/hanzo
            ./modules/nvf
            ./modules/stylix
            ./secrets/certs.nix
            ./secrets/firewall.nix
            ./hosts/hanzo/hardware-configuration.nix
            inputs.nvf.nixosModules.default
            inputs.stylix.nixosModules.stylix
            inputs.noctalia.nixosModules.default
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                backupFileExtension = "backup";
                extraSpecialArgs = { inherit inputs; };
                users.hanzo = import ./hosts/hanzo/home.nix;
                sharedModules = [
                  inputs.yandex-music.homeManagerModules.default
                  inputs.sops-nix.homeManagerModules.sops
                  inputs.noctalia.homeModules.default
                  inputs.nixcord.homeModules.nixcord
                  ./modules/noctalia.nix
                  ./modules/hypridle.nix
                  ./modules/ghostty.nix
                  ./modules/nixcord.nix
                  ./modules/fastfetch
                  ./modules/hyprland
                  ./modules/tmux.nix
                  ./modules/sops.nix
                  ./modules/yazi
                  ./modules/fish
                  ./modules/xdg
                ];
              };
            }
          ];
        };
        hanzo-thinkpad = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
            overlays = [ ];
          };
          modules = [
            ./settings
            ./modules/nvf
            ./modules/stylix
            ./secrets/certs.nix
            ./secrets/firewall.nix
            ./hosts/hanzo-thinkpad
            ./hosts/hanzo-thinkpad/hardware-configuration.nix
            inputs.nvf.nixosModules.default
            inputs.stylix.nixosModules.stylix
            inputs.noctalia.nixosModules.default
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                backupFileExtension = "backup";
                extraSpecialArgs = { inherit inputs; };
                users.hanzo = import ./hosts/hanzo-thinkpad/home.nix;
                sharedModules = [
                  inputs.yandex-music.homeManagerModules.default
                  inputs.sops-nix.homeManagerModules.sops
                  inputs.noctalia.homeModules.default
                  ./modules/noctalia.nix
                  ./modules/hypridle.nix
                  ./modules/hyprlock.nix
                  ./modules/ghostty.nix
                  ./modules/fastfetch
                  ./modules/hyprland
                  ./modules/tmux.nix
                  ./modules/sops.nix
                  ./modules/yazi
                  ./modules/fish
                  ./modules/xdg
                ];
              };
            }
          ];
        };
      };
    };
}
