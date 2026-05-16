{
  exec-once = [
    "AyuGram &"
    "clipse -listen"
    "noctalia-shell"
    "sleep 10 && hyperhdr"
    "nm-applet --indicator &"
    "sleep 5 && mattermost-desktop &"
    "wl-clip-persist --clipboard both"
    "systemctl --user start hyprpolkitagent"
    "~/.config/hypr/scripts/resetxdgportal.sh"
    "dbus-update-activation-environment --systemd --all"
  ];
  exec-shutdown = "pkill -i hyperhdr";
}
