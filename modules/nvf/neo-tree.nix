{
  filetree = {
    neo-tree = {
      enable = true;
      setupOpts = {
        git_status_async = true;
        auto_clean_after_session_restore = true;
        buffers.show_unloaded = true;
        sources = [
          "filesystem"
          "buffers"
          "git_status"
        ];
        enable_diagnostics = true;
        enable_refresh_on_write = true;
        source_selector = {
          winbar = true;
          content_layout = "center";
          sources = [
            {
              source = "filesystem";
              display_name = " Files";
            }
            {
              source = "buffers";
              display_name = "󰈙 Bufs";
            }
            {
              source = "git_status";
              display_name = "󰊢 Git";
            }
            {
              source = "diagnostics";
              display_name = "󰒡 Diagnostic";
            }
          ];
        };
        default_component_configs = {
          indent = {
            padding = 0;
          };
          icon = {
            folder_closed = "";
            folder_open = "";
            folder_empty = "";
            folder_empty_open = "";
            default = "󰈙";
          };
          modified.symbol = "";
          git_status = {
            symbols = {
              added = "";
              deleted = "";
              modified = "";
              renamed = "➜";
              untracked = "★";
              ignored = "◌";
              unstaged = "✗";
              staged = "✓";
              conflict = "";
            };
          };
        };
        filesystem = {
          hijack_netrw_behavior = "open_current";
          use_libuv_file_watcher = true;
          follow_current_file = {
            enabled = true;
            leave_dirs_open = false;
          };
        };
        window = {
          width = 40;
          mappings = {
            "<space>" = false;
            "l" = "open";
            "h" = "close_node";
          };
        };
      };
    };
  };
  maps.normal = {
    "<leader>e" = {
      silent = true;
      noremap = true;
      action = "<cmd>Neotree toggle<CR>";
      desc = "toggle neotree";
    };
    "<leader>o" = {
      silent = true;
      lua = true;
      desc = "neotree focus";
      action = ''
        function()
          if vim.bo.filetype == "neo-tree" then
            vim.cmd.wincmd "p"
          else
            vim.cmd.Neotree "focus"
          end
        end
      '';
    };
  };
}
