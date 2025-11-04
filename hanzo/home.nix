{ pkgs, inputs, ... }:

{
  imports = [
    ../modules/xdg
    ../modules/yazi
    ../modules/fish
    ../modules/sops.nix
    ../modules/hyprland
    ../modules/fastfetch
    ../modules/ghostty.nix
    ../modules/nixcord.nix
    ../modules/noctalia.nix
    ../modules/hypridle.nix
  ];

  home = {
    username = "hanzo";
    stateVersion = "25.05";
    homeDirectory = "/home/hanzo";
    packages = with pkgs; [
      uv
      fd
      jq
      xz
      bat
      zip
      eza
      fzf
      mpv
      wev
      grc
      feh
      btop
      grim
      meld
      glow
      unzip
      slurp
      hexyl
      bluez
      nodejs
      gnutar
      swappy
      scrcpy
      lolcat
      figlet
      tabiew
      rclone
      openssl
      vivaldi
      nuclear
      wttrbar
      ripgrep
      zathura
      lazygit
      zmkBATx
      windsurf
      mangohud
      rustdesk
      obsidian
      dnsutils
      cassette
      rclone-ui
      transcrypt
      traceroute
      mangojuice
      lazydocker
      dbeaver-bin
      libreoffice
      qbittorrent
      xfce.thunar
      thunderbird
      xfce.tumbler
      appimage-run
      sublime-merge
      ayugram-desktop
      hyprpolkitagent
      material-symbols
      nvtopPackages.amd
      mattermost-desktop
      xdg-desktop-portal
      python3Packages.pip
      networkmanagerapplet
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
      (pkgs.callPackage ../pkgs/ktalk.nix { })
      inputs.zen-browser.packages.${pkgs.system}.default
    ];
  };

  stylix = {
    iconTheme = {
      enable = true;
      dark = "Reversal";
      light = "Reversal";
      package = pkgs.reversal-icon-theme;
    };
  };

  services = {
    hyprsunset.enable = true;
    udiskie = {
      enable = true;
      automount = true;
      settings = {
        program_options = {
          file_manager = "${pkgs.ghostty}/bin/ghostty -e ${pkgs.yazi}/bin/yazi";
        };
      };
    };
  };

  programs = {
    home-manager.enable = true;
    obs-studio.enable = true;
    yandex-music = {
      enable = true;
      tray.enable = true;
    };
    git = {
      enable = true;
      settings = {
        init.defaultBranch = "main";
        user = {
          name = "hanzo";
        }
        // import ../secrets/git.nix;
        gpg = {
          format = "x509";
        };
        commit = {
          gpgsign = true;
        };
        alias = {
          gl = "pull";
          gp = "push";
          gb = "checkout";
          gc = "commit -m";
        };
        core = {
          editor = "vim";
        };
      };
    };
  };

  systemd.user.services.mbsync.unitConfig.After = [ "sops-nix.service" ];

  home.file = { };

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
