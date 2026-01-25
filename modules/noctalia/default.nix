{ config, osConfig, ... }:

{
  programs.noctalia-shell = {
    enable = true;
    settings = {
      colors = {
        mError = "#dddddd";
        mOnError = "#111111";
        mOnPrimary = "#111111";
        mOnSecondary = "#111111";
        mOnSurface = "#828282";
        mOnSurfaceVariant = "#5d5d5d";
        mOnTertiary = "#111111";
        mOnHover = "#ffffff";
        mOutline = "#3c3c3c";
        mPrimary = "#aaaaaa";
        mSecondary = "#a7a7a7";
        mShadow = "#000000";
        mSurface = "#111111";
        mHover = "#1f1f1f";
        mSurfaceVariant = "#191919";
        mTertiary = "#cccccc";
      };
    }
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
    // (import ./general.nix { inherit config; });
  };
}
