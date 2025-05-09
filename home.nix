{ config, pkgs, inputs, lib, ... }:

{
    imports = [ 
        ./modules/mako.nix
        ./modules/ghostty.nix
        ./modules/yazi/yazi.nix
        ./modules/waybar/config.nix
        ./modules/hyprland/default.nix
        # inputs.hyprpanel.homeManagerModules.hyprpanel
    ];

    home = {
        username = "jumanji";
        homeDirectory = "/home/jumanji";
        stateVersion = "24.11";
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
            swappy
            lolcat
            figlet
            vivaldi
            wttrbar
            ripgrep
            python3
            zathura
            obsidian
            neofetch
            dnsutils
            cliphist
            cassette
            hyprpaper
            kchmviewer
            pavucontrol
            libreoffice
            qbittorrent
            xfce.thunar
            thunderbird
            nwg-displays
            rofi-wayland
            wl-clipboard
            sublime-merge
            hyprpolkitagent
            nodePackages.npm
            mattermost-desktop
            xdg-desktop-portal
            python3Packages.pip
            networkmanagerapplet
            xdg-desktop-portal-gtk
            xdg-desktop-portal-hyprland
            inputs.ayugram-desktop.packages.${pkgs.system}.ayugram-desktop
        ];
    };

    programs = {
        home-manager.enable = true;
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
        # hyprpanel = {
        #     enable = true;
        #     overwrite.enable = true;
        #     hyprland.enable = true;
        # };
    };

    gtk = {
        enable = true;
    };

    qt = {
        enable = true;
        platformTheme.name = "qtct";
        style.name = "kvantum";
    };

    stylix = {
        iconTheme = {
            enable = true;
            dark = "kora";
            light = "kora-light";
            package = pkgs.kora-icon-theme;
        };
    };

    xdg.mimeApps.defaultApplications = {
        "text/plain" = [ "neovim.desktop" ];
        "inode/directory" = [ "yazi.desktop" ];
    };

    xdg.portal = {
        enable = true;
        xdgOpenUsePortal = true;
        extraPortals = with pkgs; [
            xdg-desktop-portal-gtk
            xdg-desktop-portal-hyprland
        ];
        config = {
            common = {
                default = [
                    "gtk"
                ];
            };
        };
    };

    services.hyprpaper.enable = true;

    home.file = {
    };

    home.sessionVariables = {
        EDITOR = "nvim";
    };
}
