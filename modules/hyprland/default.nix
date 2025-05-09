{
    wayland.windowManager.hyprland = {
        enable = true;
        xwayland.enable = true;
        settings = {
            monitor = [ "eDP-1,preferred,auto,1" ];
            workspace = map (x: "${x}, persistent:true") [ "1" "2" "3" "4" "5" "6" "7" "8"];
            layerrule = [
                "blur, launcher"
                "ignorezero , waybar"
            ];
            general = {
                gaps_in = 3;
                gaps_out = 5;
                border_size = 2;
                layout = "dwindle";
                resize_on_border = true;
            };
            misc = {
                disable_splash_rendering = true;
                disable_hyprland_logo = true;
                vrr = 2;
            };
        }
        // import ./animations.nix
        // import ./autostart.nix
        // import ./decoration.nix
        // import ./environment.nix
        // import ./input.nix
        // import ./keybindings.nix
        // import ./layouts.nix
        // import ./windowrules.nix;
    };
}
