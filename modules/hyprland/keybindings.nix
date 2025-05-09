let
    ctrl = "CTRL";
    shift = "SHIFT";
    prtSc = "PRINT";
    enter = "RETURN";
    mainMod = "SUPER";
    fileManager = "yazi";

    mkBind = mod: key: action: command: "${mod}, ${key}, ${action}, ${command}";
    mkBindM = mod: key: action: "${mod}, ${key}, ${action}";

    appBinds = [
        (mkBind mainMod enter "exec" "ghostty")
        (mkBind mainMod "V" "exec" "ghostty --class=com.clipse -e \"clipse\"")
        (mkBind mainMod "B" "exec" "vivaldi --enable-features=UseOzonePlatform --ozone-platform=wayland")
        (mkBind mainMod "T" "exec" "ghostty --class=com.filemanager -e yazi")
        (mkBind mainMod "G" "exec" "steam")
        (mkBind mainMod "P" "exec" "betterbird")
        (mkBind mainMod "L" "exec" "smerge")
        (mkBind mainMod "K" "exec" "/opt/Толк/ktalk")
        (mkBind mainMod "O" "exec" "obsidian")
        (mkBind mainMod "A" "exec" "onlyoffice-desktopeditors")
        (mkBind mainMod "I" "exec" "scrcpy --render-driver=software --window-height=1240 --window-title=\"Pixel 7\" -e")
        (mkBind mainMod "R" "exec" "ghostty --class=com.etlsrc --working-directory=/home/jumanji/etlsrc -e nvim")
        (mkBind mainMod "W" "exec" "ghostty --class=com.nvim -e nvim")
        (mkBind mainMod "Y" "exec" "rofi -show drun -replace -i")
        (mkBind mainMod "H" "exec" "hyprctl switchxkblayout all 0")
        (mkBind mainMod "N" "exec" "hyprctl switchxkblayout all 1")
    ];

    controlBinds = [
        (mkBind mainMod "Q" "killactive" "")
        (mkBind mainMod "M" "fullscreen" "")
        (mkBind mainMod "U" "togglefloating" "")
        (mkBind mainMod "J" "togglesplit" "")
    ];

    focusBinds = [
        (mkBind mainMod "S" "movefocus" "l")
        (mkBind mainMod "F" "movefocus" "r")
        (mkBind mainMod "E" "movefocus" "u")
        (mkBind mainMod "D" "movefocus" "d")
    ];

    workspaceBinds = map 
    (i: mkBind mainMod (toString i) "workspace" (toString i)) 
    (builtins.genList (x: x + 1) 9) ++ 
    [(mkBind mainMod "0" "workspace" "10")
    (mkBind mainMod "Z" "togglespecialworkspace" "special")];

    moveWorkspaceBinds = map 
    (i: mkBind "${mainMod} ${shift}" (toString i) "movetoworkspace" (toString i)) 
    (builtins.genList (x: x + 1) 9) ++ 
    [(mkBind "${mainMod} ${shift}" "0" "movetoworkspace" "10")
    (mkBind "${mainMod} ${shift}" "Z" "movetoworkspace" "special")];

    navBinds = [
        (mkBind "" "F12" "workspace" "e+1")
        (mkBind "" "F11" "workspace" "e-1")
        (mkBind mainMod "mouse_down" "workspace" "e+1")
        (mkBind mainMod "mouse_up" "workspace" "e-1")
    ];

    resizeBinds = [
        (mkBind "${mainMod} ${shift}" "right" "resizeactive" "100 0")
        (mkBind "${mainMod} ${shift}" "left" "resizeactive" "-100 0")
        (mkBind "${mainMod} ${shift}" "up" "resizeactive" "0 -100")
        (mkBind "${mainMod} ${shift}" "down" "resizeactive" "0 100")
    ];

    screenshotBinds = [
        (mkBind "" prtSc "exec" "grim -g \"$(slurp)\" - | swappy -f -")
        (mkBind ctrl prtSc "exec" "grim ~/Pictures/Screenshots/$(date +'%Y-%m-%d_%H-%M-%S').png")
    ];

    mouseBinds = [
        (mkBindM mainMod "mouse:272" "movewindow")
        (mkBindM mainMod "mouse:273" "resizewindow")
    ];

    mediaBinds = [
        (mkBind "" "XF86AudioPlay" "exec" "playerctl play-pause")
        (mkBind "" "XF86AudioNext" "exec" "playerctl next")
        (mkBind "" "XF86AudioRaiseVolume" "exec" "pactl set-sink-volume @DEFAULT_SINK@ +5%")
        (mkBind "" "XF86AudioLowerVolume" "exec" "pactl set-sink-volume @DEFAULT_SINK@ -5%")
        (mkBind "" "XF86MonBrightnessUp" "exec" "brightnessctl -q s +20%")
        (mkBind "" "XF86MonBrightnessDown" "exec" "brightnessctl -q s 20%-")
    ];
in

{
    bind = appBinds ++ controlBinds ++ focusBinds ++ workspaceBinds ++ moveWorkspaceBinds ++ navBinds ++ resizeBinds;
    bindl = screenshotBinds;
    bindm = mouseBinds;
    binde = mediaBinds;
}
