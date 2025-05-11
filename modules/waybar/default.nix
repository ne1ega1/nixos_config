{ pkgs, sys, ... }:

{
    programs.waybar = {
        enable = true;
        systemd.enable = true;
        settings = {
            bar = {
                layer = "top";
                position = "top";
                mod = "dock";
                reload_style_on_change = true;

                modules-left = [
                    "custom/launcher"
                    "group/ru-dark"
                    "group/ld-soft"
                    "hyprland/workspaces"
                    "group/ru-soft"
                    "group/ld-dark"
                    "group/group-misc"
                    "group/ru-dark"
                ];
                modules-center = [
                    # "group/lu-soft"
                    "clock"
                    # "group/ru-soft"
                ];
                modules-right = [
                    "group/lu-dark"
                    "tray"
                    "group/rd-dark"
                    "group/lu-soft"
                    "hyprland/language"
                    "custom/sp2"
                    "pulseaudio"
                    "custom/sp2"
                    "cpu"
                    "custom/sp2"
                    "memory"
                    "custom/sp2"
                    "temperature"
                    "group/rd-soft"
                    "group/lu-dark"
                    "group/group-power"
                ];

                tray = {
                    icon-size = 18;
                    spacing = 20;
                };
                "custom/left" = {
                    tooltip = false;
                };
                "custom/right" = {
                    tooltip = false;
                };
                "custom/sp1" = {
                    format = " | ";
                    tooltip = false;
                };
                "custom/sp2" = {
                    format = "\\";
                    tooltip = false;
                };
                "custom/rofi" = {
                    format = "";
                    tooltip = false;
                    on-click = "rofi -show drun";
                    escape = true;
                };
                "custom/launcher" = {
                    format = "  ";
                    on-click = "exec rofi -show drun -replace -i";
                    tooltip = false;
                };
                "custom/settings" = {
                    format = "";
                    on-click = " ";
                    tooltip = false;
                };
                "clock" = {
                    # format = " {:%H:%M:%S %p}";
                    # format = " {:%d-%h-%Y}";
                    # format = " {:%a}";
                    # format = "{:%H:%M %d/%m %A}";
                    interval = 60;
                    format = "{:%H:%M  %B  %e  %A}";
                    tooltip-format = "<tt><small>{calendar}</small></tt>";
                    # on-click = "merkuro-calendar";
                    calendar = {
                        mode = "month";
                        mode-mon-col = 3;
                        weeks-pos = "right";
                        on-scroll = 1;
                        on-click-right = "mode";
                        format = {
                            months = "<span color='#ffead3'><b>{}</b></span>";
                            days = "<span color='#ecc6d9'><b>{}</b></span>";
                            weeks = "<span color='#99ffdd'><b>W{}</b></span>";
                            weekdays = "<span color='#ffcc66'><b>{}</b></span>";
                            today = "<span color='#ff6699'><b><u>{}</u></b></span>";
                        };
                    };
                };
                "hyprland/language" = {
                    format = "  {}";
                    format-en = "US";
                    format-ru = "RU";
                };
                "hyprland/window" = {
                    max-length = 100;
                    separate-outputs = true;
                };
                "hyprland/workspaces" = {
                    all-outputs = true;
                    format = "{icon}";
                    format-icons = {
                        default = "";
                        empty = "";
                        urgent = "󱓺";
                        active = "";
                    };
                    on-scroll-up = "hyprctl dispatch workspace e+1 1>/dev/null";
                    on-scroll-down = "hyprctl dispatch workspace e-1 1>/dev/null";
                    sort-by-number = true;
                    active-only = false;
                    persistent_workspaces = {
                        "1-8" = [
                            "eDP-1"
                        ];
                    };
                };
                "wlr/taskbar" = {
                    format = "{icon}";
                    icon-size = 18;
                    spacing = 1;
                    # icon-theme = "Nordzy";
                    all-outputs = false;
                    tooltip-format = "{title}";
                    on-click = "activate";
                    on-click-middle = "close";
                    transition-left-to-right = true;
                    ignore-list = [
                        "Alacritty"
                    ];
                };
                "pulseaudio" = {
                    scroll-step = 5;
                    # format = "{icon}  {volume}%";
                    format = "   {volume}% ";
                    format-bluetooth = "{volume}% {icon} {format_source}";
                    format-bluetooth-muted = " {icon} {format_source}";
                    format-muted = " {format_source}";
                    # format-source = "{volume}% ";
                    format-source = "";
                    format-source-muted = "";
                    format-icons = {
                        headphone = "";
                        hands-free = "";
                        headset = "";
                        phone = "";
                        portable = "";
                        car = "";
                        default = [
                            ""
                            ""
                            ""
                        ];
                    };
                    on-click = "pavucontrol";
                    on-click-right = "amixer sset Master toggle";
                };
                "idle_inhibitor" = {
                    format = "{icon} ";
                    icon-size = 22;
                    format-icons = {
                        activated = "󰔡";
                        deactivated = "󰨙";
                    };
                    tooltip = "true";
                    on-click-right = "hyprlock";
                };
                "custom/notification" = {
                    tooltip = false;
                    # format = " ";
                    format = "{icon}";
                    # format-icons = {
                    #     notification = "<span foreground='red'><sup></sup></span>";
                    #     none = "";
                    #     dnd-notification = "<span foreground='red'><sup></sup></span>";
                    #     dnd-none = "";
                    #     inhibited-notification = "<span foreground='red'><sup></sup></span>";
                    #     inhibited-none = "";
                    #     dnd-inhibited-notification = "<span foreground='red'><sup></sup></span>";
                    #     dnd-inhibited-none = ""
                    # };
                    return-type = "json";
                    exec-if = "which swaync-client";
                    exec = "swaync-client -swb";
                    on-click = "swaync-client -t -sw";
                    on-click-right = "swaync-client -d -sw";
                    escape = true;
                };
                "custom/power" = {
                    format = " ";
                    on-click = "shutdown";
                    tooltip = false;
                };
                "custom/reboot" = {
                    format = "󰑓 ";
                    on-click = "reboot";
                    tooltip = false;
                };
                "custom/lock" = {
                    format = "󰍁 ";
                    on-click = "hyprlock";
                    tooltip = false;
                };


                # Hardware --------------------------------------------------------------

                "cpu" = {
                    interval = 1;
                    format = "  {}%";
                    # format = "{max_frequency}GHz <span color=\"darkgray\">| {usage}%</span>";
                    max-length = 13;
                    min-length = 8;
                    on-click = "kitty -e btop";
                };
                "memory" = {
                    interval = 5;
                    # format = "  {used:0.2f} / {total:0.0f} GB";
                    # format = "{}%";
                    format = "  {}%";
                    # min-length = 8;
                    on-click = "kitty -e btop";
                };
                "temperature" = {
                    interval = 3;
                    critical-threshold = 80;
                    # format-critical = " {temperatureC}°C";
                    format-critical = "  {temperatureC}°C";
                    format = " {temperatureC}°C";
                    format-icons = [
                        ""
                        ""
                        ""
                    ];
                    max-length = 7;
                    # min-length = 7;
                    on-click = "xsensors";
                };
                "custom/tmpicon" = {
                    format = "";
                    on-click = "pkill btop || ghostty -e btop";
                    tooltip = false;
                };
                "custom/memicon" = {
                    format = " ";
                    on-click = "pkill btop || ghostty -e btop";
                    tooltip = false;
                };

                # Custom --------------------------------------------------------------

                "custom/cava-internal" = {
                    # format = "  {}";
                    format = "🎜 {}";
                    exec = "cava -p ~/.config/cava/internal_config | sed -u 's/;//g;s/0/▁/g;s/1/▂/g;s/2/▃/g;s/3/▄/g;s/4/▅/g;s/5/▆/g;s/6/▇/g;s/7/█/g;'";
                    tooltip = false;
                };

                # Groups --------------------------------------------------------------

                "group/tray" = {
                    orientation = "horizontal";
                    spacing = 25;
                    modules = [
                        "tray"
                        "idle_inhibitor"
                    ];
                };
                "group/group-misc" = {
                    orientation = "inherit";
                    drawer = {
                        transition-duration = 500;
                        children-class = "not-misc";
                        transition-left-to-right = true ;
                    };
                    modules = [
                        "custom/weather"
                        "idle_inhibitor"
                    ];
                };

                "group/group-power" = {
                    orientation = "inherit";
                    drawer = {
                        transition-duration = 500;
                        children-class = "not-power";
                        transition-left-to-right = false;
                    };
                    modules = [
                        "custom/power"
                        "custom/reboot"
                        "custom/lock"
                    ];
                };

                # Other ---------------------------------------------------------------

                "custom/langicon" = {
                    format = " ";
                    tooltip = false;
                };
                "custom/volicon" = {
                    format = " ";
                    tooltip = false;
                };
                "custom/weather" = {
                    format = "{}";
                    tooltip = true;
                    interval = 60;
                    exec = "wttrbar --location Gubkin --custom-indicator '{ICON} {temp_C}° (feels like {FeelsLikeC}°)'";
                    return-type = "json";
                };
                "custom/media" = {
                    format = "{icon} {}";
                    return-type = "json";
                    max-length = 40;
                    format-icons = {
                        spotify = "";
                        default = "🎜";
                    };
                    escape = true;
                    exec = "$HOME/.config/waybar/mediaplayer.py 2> /dev/null";
                    # exec = "$HOME/.config/waybar/mediaplayer.py --player spotify 2> /dev/null" // Filter player based on name
                };
                "battery" = {
                    interval = 2;
                    states = {
                        good = 95;
                        warning = 30;
                        critical = 15;
                    };
                    format = "{icon} {capacity}%";
                    format-charging = " {capacity}%";
                    format-plugged = " {capacity}%";
                    format-icons = [
                        " "
                        " "
                        " "
                        " "
                        " "
                    ];
                };
                "network" = {
                    format-wifi = "  {essid} ({signalStrength}%)  ";
                    format-ethernet = "{ifname}: {ipaddr}/{cidr} ";
                    format-linked = "{ifname} (No IP) ";
                    format = "";
                    format-disconnected = "";
                    format-alt = "{ifname}: {ipaddr}/{cidr}";
                    on-click = "wl-copy $(ip address show up scope global | grep inet | head -n1 | cut -d/ -f 1 | tr -d [:space:] | cut -c5-)";
                    on-click-right = "wl-copy $(ip address show up scope global | grep inet6 | head -n1 | cut -d/ -f 1 | tr -d [:space:] | cut -c6-)";
                    tooltip-format = " {bandwidthUpBits}  {bandwidthDownBits}\n{ifname}\n{ipaddr}/{cidr}\n";
                    tooltip-format-wifi = " {essid} {frequency}MHz\nStrength: {signaldBm}dBm ({signalStrength}%)\nIP: {ipaddr}/{cidr}\n {bandwidthUpBits}  {bandwidthDownBits}";
                    interval = 10;
                };
                "backlight" = {
                    device = "intel_backlight";
                    format = "{icon} {percent}%";
                    format-alt = "{percent}% {icon}";
                    format-alt-click = "click-right";
                    # format-icons = [""; ""];
                    format-icons = [
                        ""
                        ""
                    ];
                    on-scroll-down = "brightnessctl s 5%-";
                    on-scroll-up = "brightnessctl s +5%";
                };
                "custom/gammastep" = {
                    interval = 5;
                    return-type = "json";
                    exec = {
                        pre = "if unit_status=\"$(systemctl --user is-active gammastep)\"; then\nstatus=\"$unit_status ($(journalctl --user -u gammastep.service -g 'Period: ' | tail -1 | cut -d ':' -f6 | xargs))\"\nelse\nstatus=\"$unit_status\"\nfi";
                        alt = "${status:-inactive}";
                        tooltip = "Gammastep is $status";
                    };
                    format = "{icon}";
                    format-icons = {
                        activating = "󰁪 ";
                        deactivating = "󰁪 ";
                        inactive = "? ";
                        # active (Night) = " ";
                        # active (Nighttime) = " ";
                        # active (Transition (Night) = " ";
                        # active (Transition (Nighttime) = " ";
                        # active (Day) = " ";
                        # active (Daytime) = " ";
                        # active (Transition (Day) = " ";
                        # active (Transition (Daytime) = " ";
                    };
                    on-click = "systemctl --user is-active gammastep && systemctl --user stop gammastep || systemctl --user start gammastep";
                };
                "mpd" = {
                    max-length = 25;
                    format = "<span foreground='#bb9af7'></span> {title}";
                    format-paused = " {title}";
                    format-stopped = "<span foreground='#bb9af7'></span>";
                    format-disconnected = "";
                    on-click = "mpc --quiet toggle";
                    on-click-right = "mpc update; mpc ls | mpc add";
                    on-click-middle = "alacritty -e ncmpcpp";
                    on-scroll-up = "mpc --quiet prev";
                    on-scroll-down = "mpc --quiet next";
                    smooth-scrolling-threshold = 5;
                    tooltip-format = "{title} - {artist} ({elapsedTime:%M:%S}/{totalTime:%H:%M:%S})";
                };
                "custom/title" = {
                    format = "{}";
                    interval = 0;
                    return-type = "json";
                    # max-length = 35;
                    tooltip = false;
                };
                "custom/title#name" = {
                    format = "{}";
                    interval = 0;
                    return-type = "json";
                    max-length = 35;
                    exec = "$HOME/.scripts/title";
                };
                "custom/keyboard" = {
                    format = " {}";
                    interval = 1;
                    exec = "$HOME/.config/waybar/get_kbdlayout.sh";
                };
                "wireplumber" = {
                    on-click = "pavucontrol";
                    on-click-right = "amixer sset Master toggle 1>/dev/null";
                    # on-click: "${wpctl} set-mute @DEFAULT_AUDIO_SINK@ toggle";
                    # on-scroll-down: "${wpctl} set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 0.04+";
                    # on-scroll-up: "${wpctl} set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 0.04-";
                    format = "<span foreground='#fab387'>{icon}</span>  {volume}%";
                    format-muted = " ";
                    format-source = "";
                    format-source-muted = "";
                    # format-muted = "<span foreground='#fab387'> </span>";
                    # format-icons" = [ "<span foreground='#fab387'></span>" ]
                    format-icons = {
                        headphone = " ";
                        hands-free = " ";
                        headset = " ";
                        phone = " ";
                        portable = " ";
                        car = " ";
                        default = [
                            " "
                            " "
                            " "
                        ];
                    };
                };
                "custom/screenshot_t" = {
                    format = "";
                    on-click = "~/.config/hypr/scripts/screenshot_full";
                    on-click-right = "~/.config/hypr/scripts/screenshot_area";
                };
					#            "custom/pipewire" = let pamixer = "${pkgs.pamixer}/bin/pamixer"; in {
					#                format = "{}";
					#                exec = "sleep 0.05 && echo $(${pamixer} --get-mute)$(${pamixer} --get-volume) | sed 's/true/ /' | sed 's/false/) /'";
					#                on-click = "${pamixer} -t; pkill -x -RTMIN+11 waybar";
					#                on-scroll-up = "${pamixer} -i2; pkill -x -RTMIN+11 waybar";
					#                on-scroll-down = "${pamixer} -d2; pkill -x -RTMIN+11 waybar";
					#                signal = 11;
					#                interval = 5;
					#                tooltip = false;
					#            };
					#            "custom/battery" = {
					#                format = "{}";
					#                exec = "${import ./battery.nix { inherit pkgs; }}/bin/waybar_battery";
					#                interval = 5;
					#            };
					#            "custom/brightness" = {
					#                format = "{}";
					#                interval = 5;
					#                on-scroll-up = "${import ./brightness.nix { inherit pkgs; }}/bin/waybar-brightness raise > /dev/null";
					#                on-scroll-down = "${import ./brightness.nix { inherit pkgs; }}/bin/waybar-brightness lower > /dev/null";
					#                exec = "${import ./brightness.nix { inherit pkgs; }}/bin/waybar-brightness get";
					#            };
					#            "mpd" = {
					#                format = "  {artist} - {title}";
					# format-paused = " {artist} - {title}";
					# format-stopped = "";
					# on-click = "${pkgs.mpc-cli}/bin/mpc prev";
					# on-click-right = "${pkgs.mpc-cli}/bin/mpc next";
					# on-click-middle = "${pkgs.mpc-cli}/bin/mpc toggle";
					#            };
					#            "custom/cava" = {
					#                format = "{}";
					#                return-type = "text";
					#                max-length = 50;
					#                escape = true;
					#                tooltip = false;
					#                exec = "${import ./cava.nix { inherit pkgs; }}/bin/cava_waybar";
					#            };
            };
        };
        style = with sys.lib.stylix.colors; ''
			${builtins.readFile ./style.css}
        '';
    };
}
