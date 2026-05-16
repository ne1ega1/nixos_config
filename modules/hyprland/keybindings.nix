let
  ctrl = "CTRL";
  shift = "SHIFT";
  prtSc = "PRINT";
  enter = "RETURN";
  mainMod = "SUPER";

  mkBind = mod: key: action: command: "${mod}, ${key}, ${action}, ${command}";
  mkBindM = mod: key: action: "${mod}, ${key}, ${action}";

  appBinds = [
    (mkBind "" "XF86Tools" "exec" "ghostty")
    (mkBind "" "XF86Launch5" "exec" "ghostty --class=com.nvim -e nvim")
    (mkBind "" "XF86Launch6" "exec" "ghostty --class=com.filemanager -e yazi")
    (mkBind "" "XF86Launch7" "exec" "ghostty --class=com.etlsrc --working-directory=/home/hanzo/etlsrc -e nvim")
    (mkBind "" "XF86Launch8" "exec" "evolution")
    (mkBind "" "XF86Launch9" "exec" "ktalk")
    (mkBind "" "XF86AudioMicMute" "exec" "noctalia-shell ipc call launcher toggle")
    (mkBind "" "XF86TouchpadToggle" "exec" "zen")
    (mkBind "" "XF86TouchpadOn" "exec" "steam")
    (mkBind "" "XF86TouchpadOff" "exec" "obsidian")
    (mkBind mainMod "H" "exec" "hyprctl switchxkblayout all 0")
    (mkBind mainMod "N" "exec" "hyprctl switchxkblayout all 1")
    (mkBind mainMod "P" "exec" "scrcpy --render-driver=software --window-height=1240 --tcpip --window-title=\"Pixel 7\"")
    (mkBind mainMod "T" "exec" "noctalia-shell ipc call plugin togglePanel clipper")
    (mkBind mainMod enter "exec" "ghostty")
  ];

  controlBinds = [
    (mkBind mainMod "Q" "killactive" "")
    (mkBind mainMod "W" "fullscreen" "")
    (mkBind mainMod "E" "togglefloating" "")
    (mkBind mainMod "R" "togglesplit" "")
  ];

  focusBinds = [
    (mkBind mainMod "H" "movefocus" "l")
    (mkBind mainMod "L" "movefocus" "r")
    (mkBind mainMod "K" "movefocus" "u")
    (mkBind mainMod "J" "movefocus" "d")
  ];

  navBinds = [
    (mkBind "" "F12" "workspace" "e+1")
    (mkBind "" "F11" "workspace" "e-1")
    (mkBind mainMod "mouse_down" "workspace" "e+1")
    (mkBind mainMod "mouse_up" "workspace" "e-1")
  ];

  resizeBinds = [
    (mkBind "${mainMod} ${shift}" "L" "resizeactive" "100 0")
    (mkBind "${mainMod} ${shift}" "J" "resizeactive" "-100 0")
    (mkBind "${mainMod} ${shift}" "I" "resizeactive" "0 -100")
    (mkBind "${mainMod} ${shift}" "K" "resizeactive" "0 100")
  ];

  moveSwapBindsDwindle = [
    (mkBind "${mainMod} ${ctrl}" "H" "swapwindow" "l")
    (mkBind "${mainMod} ${ctrl}" "L" "swapwindow" "r")
    (mkBind "${mainMod} ${ctrl}" "K" "swapwindow" "u")
    (mkBind "${mainMod} ${ctrl}" "J" "swapwindow" "d")
  ];

  moveSwapBindsMaster = [
    (mkBind "${mainMod} ${ctrl}" "H" "moveactive" "-50 0")
    (mkBind "${mainMod} ${ctrl}" "L" "moveactive" "50 0")
    (mkBind "${mainMod} ${ctrl}" "K" "moveactive" "0 -50")
    (mkBind "${mainMod} ${ctrl}" "J" "moveactive" "0 50")
  ];

  scrollingBinds = [
    (mkBind "${mainMod} ${ctrl}" "H" "layoutmsg" "move -col")
    (mkBind "${mainMod} ${ctrl}" "L" "layoutmsg" "move +col")
    # (mkBind "${mainMod} ${shift}" "J" "layoutmsg" "movewindowto d")
    # (mkBind "${mainMod} ${shift}" "K" "layoutmsg" "movewindowto u")
    (mkBind "${mainMod} ${shift}" "H" "layoutmsg" "swapcol l")
    (mkBind "${mainMod} ${shift}" "L" "layoutmsg" "swapcol r")
    (mkBind "${mainMod} ${shift}" "U" "layoutmsg" "colresize -0.1")
    (mkBind "${mainMod} ${shift}" "I" "layoutmsg" "colresize +0.1")
  ];

  switchLayoutBinds = [
    (mkBind "${ctrl} ${shift}" "1" "exec" "hyprctl switchxkblayout eh-velvet-v3-ui-keyboard 0")
    (mkBind "${ctrl} ${shift}" "2" "exec" "hyprctl switchxkblayout eh-velvet-v3-ui-keyboard 1")
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

  workspaceBinds = [
    (mkBind mainMod "A" "workspace" "1")
    (mkBind mainMod "S" "workspace" "2")
    (mkBind mainMod "D" "workspace" "3")
    (mkBind mainMod "F" "workspace" "4")
    (mkBind mainMod "G" "workspace" "5")
    (mkBind mainMod "C" "workspace" "6")
    (mkBind mainMod "V" "workspace" "7")
    (mkBind mainMod "B" "workspace" "8")
    (mkBind mainMod "Z" "togglespecialworkspace" "special")
    (mkBind mainMod "Y" "togglespecialworkspace" "special")
  ];

  moveWorkspaceBinds = [
    (mkBind "${mainMod} ${shift}" "A" "movetoworkspace" "1")
    (mkBind "${mainMod} ${shift}" "S" "movetoworkspace" "2")
    (mkBind "${mainMod} ${shift}" "D" "movetoworkspace" "3")
    (mkBind "${mainMod} ${shift}" "F" "movetoworkspace" "4")
    (mkBind "${mainMod} ${shift}" "G" "movetoworkspace" "5")
    (mkBind "${mainMod} ${shift}" "C" "movetoworkspace" "6")
    (mkBind "${mainMod} ${shift}" "V" "movetoworkspace" "7")
    (mkBind "${mainMod} ${shift}" "B" "movetoworkspace" "8")
    (mkBind "${mainMod} ${shift}" "Z" "movetoworkspace" "special")
    (mkBind "${mainMod} ${shift}" "Y" "movetoworkspace" "special")
  ];

in
{
  bind =
    appBinds
    ++ controlBinds
    ++ focusBinds
    ++ workspaceBinds
    ++ moveWorkspaceBinds
    ++ navBinds
    ++ resizeBinds
    ++ scrollingBinds
    ++ switchLayoutBinds;
  binde = mediaBinds ++ moveSwapBindsDwindle ++ moveSwapBindsMaster;
  bindl = screenshotBinds;
  bindm = mouseBinds;
}
