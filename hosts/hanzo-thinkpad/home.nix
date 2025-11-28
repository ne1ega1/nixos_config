{ pkgs, inputs, ... }:

{
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
      nuclear
      wttrbar
      ripgrep
      zathura
      lazygit
      windsurf
      rustdesk
      obsidian
      dnsutils
      rclone-ui
      transcrypt
      lazydocker
      dbeaver-bin
      libreoffice
      qbittorrent
      xfce.thunar
      thunderbird
      xfce.tumbler
      appimage-run
      sublime-merge
      mongodb-compass
      ayugram-desktop
      hyprpolkitagent
      material-symbols
      mattermost-desktop
      xdg-desktop-portal
      python3Packages.pip
      networkmanagerapplet
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
      (pkgs.callPackage ../../pkgs/ktalk.nix { })
      inputs.zen-browser.packages.${stdenv.hostPlatform.system}.default
      # inputs.ayugram-desktop.packages.${stdenv.hostPlatform.system}.ayugram-desktop
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
    noctalia-shell.systemd.enable = true;
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
        // import ../../secrets/git.nix;
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
