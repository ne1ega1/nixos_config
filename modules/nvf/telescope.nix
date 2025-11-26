{ pkgs, ... }:

{
  telescope = {
    enable = true;
    setupOpts = {
      defaults = {
        prompt_prefix = "❯ ";
        selection_caret = "❯ ";
        multi_icon = "❯ ";
        path_display = [ "truncate" ];
        sorting_strategy = "ascending";
        layout_config = {
          horizontal = {
            prompt_position = "top";
            preview_width = 0.50;
          };
          vertical = {
            mirror = false;
          };
          width = 0.87;
          height = 0.80;
          preview_cutoff = 120;
        };
        vimgrep_arguments = [
          "${pkgs.ripgrep}/bin/rg"
          "--color=never"
          "--no-heading"
          "--with-filename"
          "--line-number"
          "--column"
          "--smart-case"
          "--hidden"
          "--no-ignore"
          "--fixed-strings"
        ];
        mappings = {
          i = {
            "<esc>" = "close";
          };
        };
      };
      extensions = {
        fzf = {
          fuzzy = true;
          override_generic_sorter = true;
          override_file_sorter = true;
          case_mode = "smart_case";
        };
      };
    };
    mappings = {
      buffers = null;
      diagnostics = null;
      findFiles = null;
      findProjects = null;
      gitBranches = null;
      gitBufferCommits = null;
      gitCommits = null;
      gitStash = null;
      gitStatus = null;
      helpTags = null;
      liveGrep = null;
      lspDefinitions = null;
      lspDocumentSymbols = null;
      lspImplementations = null;
      lspReferences = null;
      lspTypeDefinitions = null;
      lspWorkspaceSymbols = null;
      open = null;
      resume = null;
      treesitter = null;
    };
  };
  lazy.plugins.telescope.keys = [
    {
      key = "<leader>gb";
      mode = [ "n" ];
      action = ''function() require("telescope.builtin").git_branches() end'';
      silent = true;
      lua = true;
      desc = "Git branches";
    }
    {
      key = "<leader>gc";
      mode = [ "n" ];
      action = ''function() require("telescope.builtin").git_commits() end'';
      silent = true;
      lua = true;
      desc = "Git commits";
    }
    {
      key = "<leader>gC";
      mode = [ "n" ];
      action = ''function() require("telescope.builtin").git_bcommits() end'';
      silent = true;
      lua = true;
      desc = "Git commits (current file)";
    }
    {
      key = "<leader>gt";
      mode = [ "n" ];
      action = ''function() require("telescope.builtin").git_status() end'';
      silent = true;
      lua = true;
      desc = "Git status";
    }
    {
      key = "<leader>f<CR>";
      mode = [ "n" ];
      action = ''function() require("telescope.builtin").resume() end'';
      silent = true;
      lua = true;
      desc = "Resume previous search";
    }
    {
      key = "<leader>f'";
      mode = [ "n" ];
      action = ''function() require("telescope.builtin").marks() end'';
      silent = true;
      lua = true;
      desc = "Find marks";
    }
    {
      key = "<leader>fB";
      mode = [ "n" ];
      action = ''function() require("telescope.builtin").buffers() end'';
      silent = true;
      lua = true;
      desc = "Find buffers";
    }
    {
      key = "<leader>fw";
      mode = [ "n" ];
      action = ''function() require("telescope.builtin").grep_string() end'';
      silent = true;
      lua = true;
      desc = "Find word under cursor in project";
    }
    {
      key = "<leader>fC";
      mode = [ "n" ];
      action = ''function() require("telescope.builtin").commands() end'';
      silent = true;
      lua = true;
      desc = "Find commands";
    }
    {
      key = "<leader>fh";
      mode = [ "n" ];
      action = ''function() require("telescope.builtin").help_tags() end'';
      silent = true;
      lua = true;
      desc = "Find help";
    }
    {
      key = "<leader>fk";
      mode = [ "n" ];
      action = ''function() require("telescope.builtin").keymaps() end'';
      silent = true;
      lua = true;
      desc = "Find keymaps";
    }
    {
      key = "<leader>fm";
      mode = [ "n" ];
      action = ''function() require("telescope.builtin").man_pages() end'';
      silent = true;
      lua = true;
      desc = "Find man";
    }
    {
      key = "<leader>fn";
      mode = [ "n" ];
      action = ''function() require("telescope").extensions.notify.notify() end'';
      silent = true;
      lua = true;
      desc = "Find notifications";
    }
    {
      key = "<leader>fo";
      mode = [ "n" ];
      action = ''function() require("telescope.builtin").oldfiles() end'';
      silent = true;
      lua = true;
      desc = "Find recent";
    }
    {
      key = "<leader>fv";
      mode = [ "n" ];
      action = ''function() require("telescope.builtin").registers() end'';
      silent = true;
      lua = true;
      desc = "Find vim registers";
    }
    {
      key = "<leader>ft";
      mode = [ "n" ];
      action = ''function() require("telescope.builtin").buffers() end'';
      silent = true;
      lua = true;
      desc = "Find buffers";
    }
    {
      key = "<leader>ff";
      mode = [ "n" ];
      action = ''function() require("telescope.builtin").find_files { hidden = true, no_ignore = true } end'';
      silent = true;
      lua = true;
      desc = "Find all files";
    }
    {
      key = "<leader>fF";
      mode = [ "n" ];
      action = '':Telescope find_files<CR>'';
      silent = true;
      desc = "Find files (no hidden)";
    }
    {
      key = "<leader>fg";
      mode = [ "n" ];
      action =
        #lua
        ''
          function()
            require("telescope.builtin").live_grep({
              additional_args = function(args)
                args.additional_args = { "--hidden", "--no-ignore" }
                return args.additional_args
              end
            })
          end
        '';
      silent = true;
      lua = true;
      desc = "find words in project";
    }
    {
      key = "<leader>fG";
      mode = [ "n" ];
      action = ''function() require("telescope.builtin").live_grep() end'';
      silent = true;
      lua = true;
      desc = "find words in project (no hidden)";
    }
    {
      key = "<leader>f/";
      mode = [ "n" ];
      action = ''function() require("telescope.builtin").current_buffer_fuzzy_find() end'';
      silent = true;
      lua = true;
      desc = "find words in current buffer";
    }
    {
      key = "<leader>ls";
      mode = [ "n" ];
      action = ''function() require("telescope").extensions.aerial.aerial() end'';
      silent = true;
      lua = true;
      desc = "search symbol in buffer";
    }
    {
      key = "gs";
      mode = [ "n" ];
      action = ''function() require("telescope").extensions.aerial.aerial() end'';
      silent = true;
      lua = true;
      desc = "search symbol in buffer";
    }
    {
      key = "<leader>fp";
      mode = [ "n" ];
      action = ''function() vim.cmd("Telescope projects") end'';
      silent = true;
      lua = true;
      desc = "find project";
    }
    {
      key = "<leader>fs";
      mode = [ "n" ];
      action = ''function() require("telescope").extensions.luasnip.luasnip {} end'';
      silent = true;
      lua = true;
      desc = "find snippets";
    }
    {
      key = "<leader>fy";
      mode = [ "n" ];
      action = ''function() require("telescope").extensions.neoclip.default() end'';
      silent = true;
      lua = true;
      desc = "find yank history";
    }
    {
      key = "<leader>fq";
      mode = [ "n" ];
      action = ''function() require("telescope").extensions.macroscope.default() end'';
      silent = true;
      lua = true;
      desc = "find macro history";
    }
    {
      key = "<leader>fu";
      mode = [ "n" ];
      action = ''function() require("telescope").extensions.neoclip.default() end'';
      silent = true;
      lua = true;
      desc = "search symbol in buffer";
    }
    {
      key = "<leader>ls";
      mode = [ "n" ];
      action = ":Telescope aerial<CR>";
      silent = true;
      desc = "search symbol in buffer";
    }
    {
      key = "<leader>la";
      mode = [ "n" ];
      action = ''function() require("actions-preview").code_actions() end'';
      silent = true;
      lua = true;
      desc = "search symbol in buffer";
    }
    # {
    #   key = "<leader>z";
    #   mode = [ "n" ];
    #   action = ":Telescope zoxide list<CR>";
    #   silent = true;
    #   desc = "change directory using zoxide";
    # }
  ];
  luaConfigRC.telescope = ''
    require('telescope').load_extension('fzf')
  '';
  extraPlugins = {
    telescope-fzf-nvim = {
      package = pkgs.vimPlugins.telescope-fzf-native-nvim;
    };
    # telescope-zoxide = {
    #   package = pkgs.vimPlugins.telescope-zoxide;
    # };
    neoclip = {
      package = pkgs.vimPlugins.nvim-neoclip-lua;
    };
  };
}
