{ lib, config, ... }:

{
    programs.fastfetch = {
        enable = true;
        settings = {
            logo = {
                color = {
                    "1" = "cyan";
                    "2" = "blue";
                };
            };
            display = {
                separator = "  ";
                color = {
                    keys = "cyan";
                    title = "blue";
                };
                bar = {
                    width = 10;
                    charElapsed = "";
                    charTotal = " ";
                };
                percent = {
                    type = 2;
                };
            };
            modules = [
                {
                    type = "custom";
                    format = "┌────────────── Hardware Information ──────────────┐";
                }
                {
                    type = "host";
                    format = "{1}";
                    key = "├";
                }
                {
                    type = "cpu";
                    key = "├󰻠";
                    format = "{name} {freq-max}";
                }
                {
                    type = "gpu";
                    key = "├󰍛";
                }
                {
                    type = "memory";
                    key = "├󰑭";
                    percent = {
                        type = 2;
                        cyan = 50;
                        yellow = 80;
                    };
                }
                {
                    type = "disk";
                    key = "├";
                    percent = {
                        type = 2;
                        cyan = 50;
                        yellow = 80;
                    };
                }
                {
                    type = "custom";
                    format = "├────────────── Software Information ──────────────┤";
                }
                {
                    type = "title";
                    key = "├";
                    format = "{1}@{2}";
                }
                {
                    type = "os";
                    key = "├";
                }
                {
                    type = "kernel";
                    key = "├";
                    format = "{1} {2}";
                }
                {
                    type = "de";
                    key = "├";
                }
                {
                    type = "wm";
                    key = "├";
                    format = "{1}";
                }
                {
                    type = "shell";
                    key = "├";
                }
                {
                    type = "terminal";
                    key = "├";
                }
                {
                    type = "theme";
                    key = "├󰉼";
                }
                {
                    type = "icons";
                    key = "├󰀻";
                }
                {
                    type = "font";
                    key = "├";
                    format = "{2}";
                }
                {
                    type = "packages";
                    key = "├󰏖";
                }
                {
                    type = "uptime";
                    key = "├󰅐";
                }
                {
                    type = "custom";
                    format = "└──────────────────────────────────────────────────┘";
                }
                {
                    type = "colors";
                    paddingLeft = 2;
                    symbol = "circle";
                }
            ];
        };
    };
}
