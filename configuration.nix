{ config, pkgs, lib, ... }:

{
    imports = [
        ./modules/stylix
        ./hardware-configuration.nix
    ];

    boot = {
        initrd.kernelModules = [ "nvidia" "i915" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];
        kernelParams = [ "nvidia-drm.fbdev=1" ];
        plymouth.enable = true;
        loader = {
            systemd-boot.enable = true;
            efi.canTouchEfiVariables = true;
        };
    };

    hardware = {
        graphics.enable = true;
        nvidia = {
            modesetting.enable = true;
            powerManagement.enable = true;
            nvidiaSettings = true;
            open = false;
        };
    };

    networking = {
        hostName = "nixos";
        networkmanager.enable = true;
    };

    services = {
        getty.autologinUser = "jumanji";
        xserver.videoDrivers = ["nvidia"];
        udev.packages = with pkgs; [
            qmk
            qmk-udev-rules
            qmk_hid
            via
            vial
        ];
    };

    virtualisation.docker = {
        enable = true;
        rootless = {
            enable = true;
            setSocketVariable = true;
        };
    };

    nix = {
        settings = {
            warn-dirty = false;
            experimental-features = [
                "nix-command"
                "flakes"
            ];
        };
        gc = {
            automatic = true;
            dates = "weekly";
            options = "--delete-older-than 7d";
        };
    };

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
        extraGroups = [ "networkmanager" "wheel" "docker" "audio" ];
        shell = pkgs.fish;
        packages = with pkgs; [];
    };

    environment.systemPackages = with pkgs; [
        ghostty
        gnumake
        neovim
        wget
        vial
        gcc
    ];

    fonts.packages = [
    ] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);

    programs = {
        fish.enable = true;
        hyprland = {
            enable = true;
            xwayland.enable = true;
        };
    };

    system.stateVersion = "24.11";
}
