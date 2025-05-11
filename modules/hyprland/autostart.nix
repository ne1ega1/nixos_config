{
    exec-once = [
        # "waybar &"
        "hyprpaper &"
        "clipse -listen"
        "ayugram-desktop &"
        "mattermost-desktop &"
        "nm-applet --indicator &"
        "wl-paste --watch cliphist store &"
        "systemctl --user start hyprpolkitagent"
        "~/.config/hypr/scripts/resetxdgportal.sh"
        "dbus-update-activation-environment --systemd --all"
        # "~/.config/qmk-hid-host/qmk-hid-host -c ~/.config/qmk-hid-host/qmk-hid-host.json"
        # "hypridle &"
    ];
}
