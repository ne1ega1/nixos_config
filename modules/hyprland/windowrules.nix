let
    mk = type: rule: "${rule}, ${type}";
    class = win: (mk "class:${win}");
    title = win: (mk "title:${win}");

    zen = "zen";
    tg = "com.ayugram";
    clipse = "com.clipse";
    picker = "Выбор файлов";
    yazi = "com.filemanager";
    term = "com.mitchellh.ghostty";
    volume = "org.pulseaudio.pavucontrol";
    pip = "^(Picture in picture|Картинка в картинке|Bild-in-Bild)$";

    termRules = map (rule: class term rule) [
        "float"
        "size 880 450"
        "opacity 1 1.2"
    ];

    volumeRules = map (rule: class volume rule) [
        "float"
        "size 800 570"
    ];

    clipseRules = map (rule: class clipse rule) [
        "float"
        "size 622 652"
    ];

    tgRules = [
        (class tg "workspace 1")
        (title "^(Просмотр медиа)$" "fullscreen")
    ];

    yaziRules = map (rule: class yazi rule) [
        "workspace 4"
        "focusonactivate"
        "opacity 1 1.2"
    ];

    zenRules = map (rule: class zen rule) [
        "workspace 5"
        "opacity 1 1.2"
        "focusonactivate"
    ];

    pickerRules = map (rule: title picker rule) [
        "workspace 4"
        "opacity 1 1.2"
        "focusonactivate"
    ];

    pipRules = map (rule: title pip rule) [
        "monitor eDP-1"
        "noinitialfocus"
        "size 35% 35%"
        "float"
        "move 100%-38% 100%-40%"
        "opacity 1 override 1 override 1"
        "pin"
    ];

    singleRules = [
        (class "Mattermost" "workspace 1")
        (class "com.etlsrc" "workspace 2")
        (class "Meld" "workspace 6")
        (class "obsidian" "workspace 6")
        (class "sublime_merge" "workspace 6")
        (class "scrcpy" "workspace 8")
        (class "ktalk" "workspace 8")
        (class "yaamp" "workspace special")
        (class "cassete" "workspace special")
        (class "^(hyprland.share.picker)$" "float")
    ];

    allRules = termRules ++ volumeRules ++ clipseRules ++ tgRules ++ 
    yaziRules ++ zenRules ++ pickerRules ++ pipRules ++
    singleRules;
in
{
    windowrulev2 = allRules;
}
