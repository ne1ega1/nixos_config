{ config, pkgs, lib, ... }:

{
	imports = [
		./hardware-configuration.nix
        ./modules/stylix/default.nix
	];

	boot = {
		loader = {
			systemd-boot.enable = true;
			efi.canTouchEfiVariables = true;
		};
		initrd.kernelModules = [ "nvidia" "i915" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];
		kernelParams = [ "nvidia-drm.fbdev=1" ];
	};

	hardware = {
		graphics.enable = true;
		nvidia.modesetting.enable = true;
		nvidia.powerManagement.enable = true;
		nvidia.open = false;
		nvidia.nvidiaSettings = true;
	};

	networking = {
		hostName = "nixos";
		networkmanager.enable = true;
	};

	services = {
		getty.autologinUser = "jumanji";
		xserver.videoDrivers = ["nvidia"];
	};

	virtualisation.docker = {
		enable = true;
		rootless = {
			enable = true;
			setSocketVariable = true;
		};
	};

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	nixpkgs.config.allowUnfree = true;

	time.timeZone = "Europe/Moscow";

	i18n = {
        defaultLocale = "en_US.UTF-8";
	    extraLocaleSettings = {
            LC_ADDRESS = "ru_RU.UTF-8";
            LC_IDENTIFICATION = "ru_RU.UTF-8";
            LC_MEASUREMENT = "ru_RU.UTF-8";
            LC_MONETARY = "ru_RU.UTF-8";
            LC_NAME = "ru_RU.UTF-8";
            LC_NUMERIC = "ru_RU.UTF-8";
            LC_PAPER = "ru_RU.UTF-8";
            LC_TELEPHONE = "ru_RU.UTF-8";
            LC_TIME = "ru_RU.UTF-8";
        };
    };
	
	users.users.jumanji = {
		isNormalUser = true;
		description = "jumanji";
		extraGroups = [ "networkmanager" "wheel" "docker" ];
		shell = pkgs.fish;
		packages = with pkgs; [];
	};

	environment.systemPackages = with pkgs; [
		ghostty
		gnumake
		neovim
		wget
		gcc
	];

    fonts.packages = [
    ] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);

	programs = {
		fish.enable = true;
	};

	system.stateVersion = "24.11";
}
