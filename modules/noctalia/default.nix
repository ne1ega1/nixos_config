{ config, pkgs, ... }:

{
  programs.noctalia-shell = {
    enable = true;
    package = pkgs.noctalia-shell.override { calendarSupport = true; };
    settings = { }
    // import ./ui.nix
    // import ./bar.nix
    // import ./osd.nix
    // import ./dock.nix
    // import ./audio.nix
    // import ./hooks.nix
    // import ./network.nix
    // import ./plugins.nix
    // import ./launcher.nix
    // import ./calendar.nix
    // import ./wallpaper.nix
    // import ./templates.nix
    // import ./nightlight.nix
    // import ./brightness.nix
    // import ./colorscheme.nix
    // import ./session_menu.nix
    // import ./notifications.nix
    // import ./control_center.nix
    // import ./system_monitor.nix
    // import ./screen_recorder.nix
    // import ../../secrets/location.nix
    // (import ./general.nix { inherit config; });
  };
}
