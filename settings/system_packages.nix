{ inputs, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    inputs.noctalia.packages.${stdenv.hostPlatform.system}.default
    gobject-introspection
    wl-clip-persist
    docker-compose
    brightnessctl
    inotify-tools
    pinentry-all
    wl-clipboard
    pkg-config
    lm_sensors
    playerctl
    cliphist
    ddcutil
    ghostty
    gnumake
    python3
    udisks2
    udiskie
    clipse
    neovim
    rustup
    meson
    ninja
    cmake
    cairo
    gnupg
    sops
    glib
    wget
    lsof
    gcc
  ];
}
