{
    imports = [
        ./keymap.nix
        ./plugins.nix
    ];

    programs.yazi = {
        enable = true;
        enableBashIntegration = true;
        initLua = ./init.lua;
        settings = {
            log.enable = true;
            manager = {
                ratio = [ 1 4 3 ];
                sort_by = "alphabetical";
                sort_sensitive = false;
                sort_reverse = false;
                sort_dir_first = true;
                sort_translit = false;
                linemode = "size";
                show_hidden = false;
                show_symlink = true;
                mouse_events = [ "click" "scroll" "touch" "move" "drag" ];
                title_format = "Yazi: {cwd}";
            };
            preview = {
                wrap = "no";
                tab_size = 4;
                max_width = 2400;
                max_height = 1600;
                cache_dir = "";
                image_delay = 30;
                image_filter = "triangle";
                image_quality = 90;
                sixel_fraction = 15;
                ueberzug_scale = 1;
                ueberzug_offset = [ 0 0 0 0 ];
            };
            plugin = {
                prepend_preloaders = [
                    {
                        mime = "application/openxmlformats-officedocument.*";
                        run = "office";
                    }
                    {
                        mime = "application/oasis.opendocument.*";
                        run = "office";
                    }
                    {
                        mime = "application/ms-*";
                        run = "office";
                    }
                    {
                        mime = "application/msword";
                        run = "office";
                    }
                    {
                        name = "*.docx";
                        run = "office";
                    }
                ];
                prepend_previewers = [
                    {
                        name = "*.tar*";
                        run  = ''piper --format=url -- tar tf "$1"'';
                    }
                    {
                        name = "*.csv";
                        run  = ''piper -- bat -p --color=always "$1"'';
                    }
                    {
                        name = "*.md";
                        run  = ''piper -- CLICOLOR_FORCE=1 glow -w=$w -s=dark "$1"'';
                    }
                    {
                        name = "*/";
                        run  = ''piper -- eza -TL=3 --color=always --icons=always --group-directories-first --no-quotes "$1"'';
                    }
                    {
                        mime = "application/openxmlformats-officedocument.*";
                        run = "office";
                    }
                    {
                        mime = "application/oasis.opendocument.*";
                        run = "office";
                    }
                    {
                        mime = "application/ms-*";
                        run = "office";
                    }
                    {
                        mime = "application/msword";
                        run = "office";
                    }
                    {
                        name = "*.docx";
                        run = "office";
                    }
                ];
                append_previewers = [
                    {
                        name = "*";
                        run  = ''piper -- hexyl --border=none --terminal-width=$w "$1"'';
                    }
                ];
            };
        };
    };
}
