{ config, pkgs, inputs, lib, ... }:

{
    imports = [ 
        ./modules/xdg
        ./modules/yazi
        ./modules/fish
        ./modules/waybar
        ./modules/hyprland
        ./modules/mako.nix
        ./modules/ghostty.nix
        ./modules/fastfetch.nix
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
            swappy
            scrcpy
            lolcat
            figlet
            vivaldi
            wttrbar
            ripgrep
            python3
            zathura
            lazygit
            obsidian
            dnsutils
            cliphist
            cassette
            hyprpaper
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
            xfce.ristretto
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
