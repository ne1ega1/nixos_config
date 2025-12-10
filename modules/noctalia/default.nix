{ config, osConfig, ... }:

{
  programs.noctalia-shell = {
    enable = true;
    settings = { }
    // import ./ui.nix
    // import ./osd.nix
    // import ./dock.nix
    // import ./audio.nix
    // import ./hooks.nix
    // import ./network.nix
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
    // (import ./bar.nix { inherit osConfig; })
    // (import ./general.nix { inherit config; })
    ;
  };
}
