{ config, pkgs, inputs, lib, ... }:

{
    imports = [ 
        ./modules/xdg
        ./modules/rofi
        ./modules/yazi
        ./modules/fish
        ./modules/waybar
        ./modules/mako.nix
        ./modules/hyprland
        ./modules/fastfetch
        ./modules/ghostty.nix
        ./modules/hypridle.nix
        ./modules/hyprlock.nix
    ];

    home = {
        username = "jumanji";
        stateVersion = "24.11";
        homeDirectory = "/home/jumanji";
        pointerCursor.hyprcursor = {
            enable = true;
            size = 24;
        };
        packages = with pkgs; [
            xz
            bat
            zip
            eza
            fzf
            mpv
            grc
            btop
            grim
            meld
            glow
            unzip
            slurp
            hexyl
            nodejs
            gnutar
            clipse
            nomacs
            swappy
            scrcpy
            lolcat
            figlet
            tabiew
            wttrbar
            ripgrep
            python3
            zathura
            lazygit
            wlsunset
            rustdesk
            obsidian
            dnsutils
            cliphist
            cassette
            lazydocker
            pavucontrol
            libreoffice
            qbittorrent
            xfce.thunar
            thunderbird
            nwg-displays
            rofi-wayland
            wl-clipboard
            xfce.tumbler
            sublime-merge
            hyprpolkitagent
            nodePackages.npm
            mattermost-desktop
            xdg-desktop-portal
            python3Packages.pip
            networkmanagerapplet
            nvtopPackages.nvidia
            xdg-desktop-portal-gtk
            xdg-desktop-portal-hyprland
            (pkgs.callPackage ./modules/pkgs/ktalk.nix { })
            inputs.zen-browser.packages.${pkgs.system}.default
            inputs.ayugram-desktop.packages.${pkgs.system}.ayugram-desktop
        ];
    };

    programs = {
        home-manager.enable = true;
        kitty.enable = true;
        obs-studio.enable = true;
        git = {
            enable = true;
            userName = "jumanji";
            userEmail = "deemonr@gmail.com";
            extraConfig.init.defaultBranch = "main";
            aliases = {
                gp = "push";
                gb = "checkout -b";
                gc = "commit -m";
            };
        };
    };

    stylix = {
        iconTheme = {
            enable = true;
            dark = "kora";
            light = "kora-light";
            package = pkgs.kora-icon-theme;
        };
    };

    services = {
        mako.enable = true;
        hyprpaper.enable = true;
    };

    home.file = {
    };

    home.sessionVariables = {
        EDITOR = "nvim";
    };
}
