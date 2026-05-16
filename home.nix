{ pkgs, inputs, ... }:

let
  workGit = import ./secrets/git_work.nix;
in
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
      sshfs
      unzip
      slurp
      hexyl
      bluez
      iperf
      nodejs
      gnutar
      swappy
      scrcpy
      lolcat
      figlet
      tabiew
      thunar
      rclone
      openssl
      vivaldi
      vesktop
      nuclear
      wttrbar
      ripgrep
      zathura
      lazygit
      spotify
      tumbler
      zmkbatx
      proxyman
      usbutils
      mangohud
      chromium
      rustdesk
      obsidian
      dnsutils
      rclone-ui
      transcrypt
      traceroute
      mangojuice
      lazydocker
      dbeaver-bin
      claude-code
      libreoffice
      qbittorrent
      thunderbird
      btrfs-progs
      pavucontrol
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
      (pkgs.callPackage ./pkgs/ktalk.nix { })
      inputs.zen-browser.packages.${stdenv.hostPlatform.system}.default
      inputs.freesm.packages.${stdenv.hostPlatform.system}.freesmlauncher
    ];
  };

  stylix = with pkgs; {
    icons = {
      enable = true;
      dark = "Reversal";
      light = "Reversal";
      package = reversal-icon-theme;
    };
  };

  services = with pkgs; {
    hyprsunset.enable = true;
    # udiskie = {
    #   enable = true;
    #   automount = true;
    #   settings = {
    #     program_options = {
    #       file_manager = "${ghostty}/bin/ghostty -e ${yazi}/bin/yazi";
    #     };
    #   };
    # };
  };

  programs = {
    home-manager.enable = true;
    obs-studio.enable = true;
    git = {
      enable = true;
      settings = {
        init.defaultBranch = "main";
        user = {
          name = "hanzo";
        }
        // import ./secrets/git.nix;
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
      includes = [
        {
          condition = "gitdir:~/etlsrc/";
          path = "~/.config/git/work-identity";
        }
      ];
    };
  };

  systemd.user.services.mbsync.unitConfig.After = [ "sops-nix.service" ];

  home.file = {
    ".config/git/work-identity".text = ''
      [user]
          name = ${workGit.name}
    '';
  };

  gtk.gtk4.theme = null;

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
