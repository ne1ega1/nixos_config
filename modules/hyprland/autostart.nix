{ osConfig, ... }:

let
    base_list = [
        "clipse -listen"
        "nm-applet --indicator &"
        "wl-clip-persist --clipboard both"
        "systemctl --user start hyprpolkitagent"
        "~/.config/hypr/scripts/resetxdgportal.sh"
        "dbus-update-activation-environment --systemd --all"
    ];
    desktop_list = [
        "AyuGram &"
        "sleep 5 && mattermost-desktop &"
    ];
in

{
  exec-once = if (osConfig.networking.hostName == "hanzo") then base_list ++ desktop_list else base_list;
}
