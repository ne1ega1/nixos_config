{
    animations = {
        enabled = true;
        bezier = [
            "wind, 0.05, 0.9, 0.1, 1.05"
            "winIn, 0.16, 1, 0.3, 1"
            "winOut, 0.16, 1, 0.3, 1"
            "liner, 1, 1, 1, 1"
        ];
        animation = [
            "windows, 1, 6, wind, popin"
            "windowsIn, 1, 6, winIn, popin"
            "windowsOut, 1, 5, winOut, popin"
            "windowsMove, 1, 5, wind, popin"
            "border, 1, 1, liner"
            "borderangle, 1, 30, liner, loop"
            "fade, 1, 10, default"
            "workspaces, 1, 5, wind, slidefade"
        ];
    };
}
