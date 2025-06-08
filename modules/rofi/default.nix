{ pkgs, sys, lib, ... }:

let
    themeContent = with sys.lib.stylix.colors; ''
        * {
            base: #1e1e2e;
            surface0: #313244;
            overlay0: #6c7086;
            text: #cdd6f4;

            mauve: #cba6f7;
            red: #f38ba8;
            peach: #fab387;
            green: #a6e3a1;
            lavender: #b4befe;

            background-color: @base;
        }

        window {
            height: 600px;
            width: 600px;

            border: 3px;
            border-radius: 10px;
            border-color: @lavender;
        }

        mainbox {
            spacing: 0;
            children: [inputbar, message, listview];
        }

        inputbar {
            color: @text;
            padding: 14px;
            background-color: @base;
        }

        message {
            padding: 10px;
            background-color: @overlay0;
        }

        listview {
            padding: 8px;
            border-radius: 0px 0px 10px 10px;
            border: 2px 2px 2px 2px;
            border-color: @base;
            background-color: @base;
            dynamic: false;
        }

        textbox {
            text-color: @text;
            background-color: inherit;
        }

        error-message {
            border: 20px 20px 20px 20px;
        }

        entry, prompt, case-indicator {
            text-color: inherit;
        }

        prompt {
            margin: 0px 10px 0px 0px;
        }

        element {
            padding: 5px;
            vertical-align: 0.5;
            border-radius: 10px;
            background-color: @surface0;
        }

        element.selected.normal {
            background-color: @overlay0;
        }

        element.alternate.normal {
            background-color: inherit;
        }

        element.normal.active, element.alternate.active {
            background-color: @peach;
        }

        element.selected.active {
            background-color: @green;
        }

        element.normal.urgent, element.alternate.urgent {
            background-color: @red;
        }

        element.selected.urgent {
            background-color: @mauve;
        }

        element-text, element-icon {
            size: 40px;
            margin: 0px 10px 0px 0px;
            vertical-align: 0.5;
            background-color: inherit;
            text-color: @text;
        }

        element-text .active, element-text .urgent {
            text-color: @base;
        }
    '';
    rofiThemeFile = pkgs.writeText "rofi-theme.rasi" themeContent;
in
{
    # stylix.targets.rofi.enable = false;
	programs.rofi = {
		enable = true;
		package = pkgs.rofi-wayland;

		theme = lib.mkForce "${rofiThemeFile}";
		extraConfig = {
			modi = "run,drun,window";
            icon-theme = "Oranchelo";
            show-icons = true;
            terminal = "ghostty";
            drun-display-format = "{icon} {name}";
            location = 0;
            disable-history = false;
            hide-scrollbar = true;
            display-drun = "   Apps ";
            display-run = "   Run ";
            display-window = " 󰕰  Window";
            display-Network = " 󰤨  Network";
            sidebar-mode = true;
		};
	};
}
