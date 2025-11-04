{
  session = {
    nvim-session-manager = {
      enable = true;

      setupOpts = {
        autoload_mode = "Disabled";
        autosave_last_session = true;
        autosave_ignore_buftypes = [
          "terminal"
          "quickfix"
          "nofile"
          "help"
        ];

        autosave_ignore_dirs = [
          "~/"
          "/tmp"
        ];
      };
    };
  };
}
