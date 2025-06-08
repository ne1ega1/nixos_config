{
    exec-once = [
        "hyprpaper &"
        "clipse -listen"
        "ayugram-desktop &"
        "mattermost-desktop &"
        "nm-applet --indicator &"
        "wlsunset -l 55.4 -L 43.3"
        "wl-paste --watch cliphist store &"
        "systemctl --user start hyprpolkitagent"
        "~/.config/hypr/scripts/resetxdgportal.sh"
        "dbus-update-activation-environment --systemd --all"
    ];
}
