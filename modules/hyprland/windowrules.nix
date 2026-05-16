let
  mk = type: rule: "${rule}, ${type}";
  class = win: (mk "match:class ${win}");
  title = win: (mk "match:title ${win}");

  zen = "zen";
  mpv = "mpv";
  tg = "com.ayugram";
  clipse = "com.clipse";
  picker = "Выбор файлов";
  yazi = "com.filemanager";
  term = "com.mitchellh.ghostty";
  pip = "^(Picture in picture|Картинка в картинке|Bild-in-Bild)$";

  termRules = map (rule: class term rule) [
    "match:float yes"
    "size 880 440"
    "opacity 1 1.2"
  ];

  clipseRules = map (rule: class clipse rule) [
    "match:float on"
    "size 622 652"
  ];

  tgRules = [
    (class tg "workspace 1")
    (title "^(Просмотр медиа)$" "match:fullscreen 1")
  ];

  yaziRules = map (rule: class yazi rule) [
    "workspace 2"
    "focus_on_activate on"
    "opacity 1 1.2"
  ];

  zenRules = map (rule: class zen rule) [
    "workspace 2"
    "opacity 1 1.2"
    "focus_on_activate on"
  ];

  mpvRules = map (rule: class mpv rule) [
    "workspace 3"
    "opacity 1 1.2"
    "focus_on_activate on"
  ];

  pickerRules = map (rule: title picker rule) [
    "workspace 2"
    "opacity 1 1.2"
    "focus_on_activate on"
  ];

  pipRules = map (rule: title pip rule) [
    "no_initial_focus on"
    "size 35% 35%"
    "match:float yes"
    "move 100%-38% 100%-40%"
    "opacity 1 override 1 override 1"
    "match:pin yes"
  ];

  singleRules = [
    (class "thunar" "workspace 1")
    (class "Mattermost" "workspace 1")
    (class "org.qbittorent.qBittorent" "workspace 1")
    (class "com.etlsrc" "workspace 2")
    (class "Meld" "workspace 3")
    (class "obsidian" "workspace 3")
    (class "sublime_merge" "workspace 4")
    (class "org.gnome.Evolution" "workspace 5")
    (class "scrcpy" "workspace 5")
    (class "ktalk" "workspace 5")
    (class "Spotify" "workspace special")
    (class "^(hyprland.share.picker)$" "match:float yes")
  ];

  allRules =
    yaziRules
    # ++ termRules
    ++ clipseRules
    ++ tgRules
    ++ zenRules
    ++ mpvRules
    ++ pickerRules
    ++ pipRules
    ++ singleRules;
in
{
  windowrule = allRules;
}
