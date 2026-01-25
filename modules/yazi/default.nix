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
      tasks.image_bound = [0 0];
      mgr = {
        title_format = "Yazi: {cwd}";
        sort_by = "alphabetical";
        sort_sensitive = false;
        sort_dir_first = true;
        sort_translit = false;
        sort_reverse = false;
        show_hidden = false;
        show_symlink = true;
        linemode = "size";
        ratio = [ 1 4 3 ];
        mouse_events = [
          "click"
          "scroll"
          "touch"
          "move"
          "drag"
        ];
      };
      preview = {
        wrap = "no";
        tab_size = 4;
        image_delay = 30;
        max_width = 9999;
        max_height = 9999;
        image_quality = 70;
        ueberzug_scale = 1;
        sixel_fraction = 15;
        image_filter = "triangle";
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
            run = ''piper --format=url -- tar tf "$1"'';
          }
          {
            name = "*.csv";
            run = ''piper -- bat -p --color=always "$1"'';
          }
          {
            name = "*.md";
            run = ''piper -- CLICOLOR_FORCE=1 glow -w=$w -s=dark "$1"'';
          }
          {
            name = "*/";
            run = ''piper -- eza -TL=3 --color=always --icons=always --group-directories-first --no-quotes "$1"'';
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
            run = ''piper -- hexyl --border=none --terminal-width=$w "$1"'';
          }
        ];
      };
    };
  };
}
