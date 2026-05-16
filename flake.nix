{
  description = "hanzo flake";

  inputs = {
    nvf.url = "github:NotAShelf/nvf";
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

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    {
      nixosConfigurations = {
        hanzo = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
            overlays = [
              (final: prev: {
                firefox = prev.firefox.overrideAttrs (oldAttrs: rec {
                  version = "114.0.2";
                  src = prev.fetchurl {
                    url = "mirror://mozilla/firefox/releases/${version}/source/firefox-${version}.source.tar.xz";
                    sha256 = "1i5ac9vlp9bfjrvddjjv31r2z6xpbx4pm6nc55vxljbpxy739pyj";
                  };
                });
              })
            ];
          };
          modules = [
            ./settings
            ./hanzo.nix
            ./modules/nvf
            ./modules/stylix
            ./secrets/certs.nix
            ./secrets/firewall.nix
            ./hardware-configuration.nix
            inputs.nvf.nixosModules.default
            inputs.stylix.nixosModules.stylix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                backupFileExtension = "backup";
                extraSpecialArgs = { inherit inputs; };
                users.hanzo = import ./home.nix;
                sharedModules = [
                  inputs.sops-nix.homeManagerModules.sops
                  inputs.noctalia.homeModules.default
                  ./modules/hypridle.nix
                  ./modules/ghostty.nix
                  ./modules/fastfetch
                  ./modules/hyprland
                  ./modules/noctalia
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
