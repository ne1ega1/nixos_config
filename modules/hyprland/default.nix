{ osConfig, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.variables = [ "--all" ];
    plugins = [
      pkgs.hyprlandPlugins.hyprscrolling
    ];
    settings = { }
    // (import ./keybindings.nix { inherit osConfig; })
    // (import ./autostart.nix { inherit osConfig; })
    // (import ./workspace.nix { inherit osConfig; })
    // (import ./layouts.nix { inherit osConfig; })
    // (import ./monitor.nix { inherit osConfig; })
    // import ./environment.nix
    // import ./windowrules.nix
    // import ./animations.nix
    // import ./decoration.nix
    // import ./general.nix
    // import ./input.nix
    // import ./misc.nix;
  };
}
