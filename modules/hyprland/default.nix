{ osConfig, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.variables = [ "--all" ];
    plugins = [
      pkgs.hyprlandPlugins.hyprscrolling
    ];
    settings = {
      monitor =
        if (osConfig.networking.hostName == "hanzo") then
          [
            "DP-1,5120x1440@144,auto,1"
          ]
        else
          [
            "HDMI-A-1,3840x2160@60,auto,1"
            "eDP-1,1920x1080@60,auto-right,1"
          ];
      layerrule = [ "blur, launcher" ];
      workspace =
        if (osConfig.networking.hostName == "hanzo") then
          map (x: "${x}, monitor:DP-1, persistent:true") [ "1" "2" "3" "4" "5" ]
        else
          [
            "1, monitor:HDMI-A-1, persistent:true, default:true"
            "2, monitor:HDMI-A-1, persistent:true"
            "3, monitor:HDMI-A-1, persistent:true"
            "4, monitor:eDP-1, persistent:true"
            "5, monitor:eDP-1, persistent:true"
            "6, monitor:eDP-1, persistent:true"
            "7, monitor:eDP-1, persistent:true"
            "8, monitor:eDP-1, persistent:true"
            "9, monitor:eDP-1, persistent:true"
            "10, monitor:eDP-1, persistent:true"
          ];
    }
    // (import ./keybindings.nix { inherit osConfig; })
    // import ./environment.nix
    // import ./windowrules.nix
    // import ./animations.nix
    // import ./decoration.nix
    // import ./autostart.nix
    // import ./layouts.nix
    // import ./general.nix
    // import ./input.nix
    // import ./misc.nix;
  };
}
