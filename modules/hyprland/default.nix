{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.variables = [ "--all" ];
    plugins = [ ];
    settings = { }
    // import ./keybindings.nix
    // import ./environment.nix
    // import ./windowrules.nix
    // import ./animations.nix
    // import ./decoration.nix
    // import ./workspace.nix
    // import ./layouts.nix
    // import ./monitor.nix
    // import ./general.nix
    // import ./input.nix
    // import ./exec.nix
    // import ./misc.nix;
  };
}
