{ config, lib, ... }:

let
    font = config.stylix.fonts;
in
{
    programs.hyprlock = with config.lib.stylix.colors; lib.mkForce {
        enable = true;
		settings = {
            background = {
                monitor = "";
                contrast = 1;
                vibrancy = 0.2;
                blur_passes = 2;
                brightness = 0.8;
                vibrancy_darkness = 0.0;
                path = "${config.stylix.image}";
            };

            general = {
                grace = 0;
                hide_cursor = true;
                no_fade_in = false;
                disable_loading_bar = false;
            };

            input-field = {
                monitor = "";
                size = "300, 60";
                dots_size = 0.2;
                halign = "center";
                valign = "center";
                dots_spacing = 0.2;
                dots_center = true;
                hide_input = false;
                position = "0, -290";
                fade_on_empty = false;
                outline_thickness = 2;
                outer_color = "rgb(${base05})";
                inner_color = "rgb(${base05})";
                font_color = "rgb(${base00})";
                check_color = "rgb(${base0E})";
                fail_color = "rgb(${base08})";
                placeholder_text = " Enter Pass";
            };

            image = {
                monitor = "";
                path = "${config.stylix.image}";
                border_size = 2;
                border_color = "rgb(${base00})";
                size = 130;
                rounding = -1;
                rotate = 0;
                reload_time = -1;
                reload_cmd = "";
                position = "0, 0";
                halign = "center";
                valign = "center";
            };

            shape = {
                monitor = "";
                size = "300, 60";
                color = "rgb(${base05})";
                rounding = -1;
                border_size = 0;
                border_color = "rgb(${base05})";
                rotate = 0;
                xray = false;
                position = "0, -210";
                halign = "center";
                valign = "center";
            };

            label = [
                {
                    monitor = "";
                    text = "cmd[update:1000] echo -e \"$(date +\"%A\")\"";
                    color = "rgb(${base00})";
                    font_size = 90;
                    font_family = "${font.monospace.name}";
                    position = "0, 350";
                    halign = "center";
                    valign = "center";
                }
                {
                    monitor = "";
                    text = "cmd[update:1000] echo -e \"$(date +\"%d %B\")\"";
                    color = "rgb(${base00})";
                    font_size = 40;
                    font_family = "${font.monospace.name}";
                    position = "0, 250";
                    halign = "center";
                    valign = "center";
                }
                {
                    monitor = "";
                    text = "cmd[update:1000] echo \"<span>$(date +\"- %H:%M -\")</span>\"";
                    color = "rgb(${base00})";
                    font_size = 20;
                    font_family = "${font.monospace.name}";
                    position = "0, 190";
                    halign = "center";
                    valign = "center";
                }
                {
                    monitor = "";
                    text = " $USER";
                    color = "rgb(${base00})";
                    outline_thickness = 2;
                    dots_size = 0.2;
                    dots_spacing = 0.2;
                    dots_center = true;
                    font_size = 18;
                    font_family = "${font.monospace.name}";
                    position = "0, -210";
                    halign = "center";
                    valign = "center";
                }
                {
                    monitor = "";
                    text = "󰐥  󰜉  󰤄";
                    color = "rgb(${base00})";
                    font_size = 50;
                    position = "0, 50";
                    halign = "center";
                    valign = "bottom";
                }
            ];
        };
    };
}
