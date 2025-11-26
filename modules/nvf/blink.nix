{
  autocomplete.blink-cmp = {
    enable = true;
    setupOpts = {
      sources = {
        default = [
          "lsp"
          "path"
          "buffer"
          "copilot"
          "lazydev"
          "snippets"
        ];
        providers = {
          lazydev = {
            name = "LazyDev";
            module = "lazydev.integrations.blink";
          };
          copilot = {
            name = "copilot";
            module = "blink-cmp-copilot";
            score_offset = 100;
            async = true;
          };
        };
      };
      keymap = {
        preset = "enter";
        "<c-Tab>" = [
          "select_prev"
          "fallback"
        ];
        "<Tab>" = [
          "select_next"
          "fallback"
        ];
        "<Esc>" = [
          "hide"
          "fallback"
        ];
      };
      completion = {
        documentation.window.border = "single";
        menu = {
          border = "single";
          draw = {
            align_to = "none";
            columns = [
              [
                "label"
                "label_description"
              ]
              [
                "kind_icon"
                "kind"
                "source_name"
              ]
            ];
          };
        };
        list = {
          selection = {
            preselect = true;
            auto_insert = false;
          };
        };
      };
    };
  };
}
