{
  keymaps = [
    # Base
    {
      mode = [ "n" ];
      key = ";";
      action = ":";
      desc = "cmd enter command mode";
    }
    {
      mode = [ "n" ];
      key = "<leader>w";
      action = ":w<CR>";
      desc = "save";
    }
    {
      mode = [ "i" ];
      key = "jj";
      action = "<Esc>";
      desc = "exit in insert mode";
    }
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>cf";
      lua = true;
      desc = "formatting";
      action = ''
        function() require("conform").format() end
      '';
    }
    {
      mode = [ "v" ];
      key = "<";
      action = "<gv";
      desc = "save selection";
    }
    {
      mode = [ "v" ];
      key = ">";
      action = ">gv";
      desc = "save selection";
    }

    # Navigation
    {
      mode = [ "n" ];
      key = "<c-k>";
      action = ":wincmd k<CR>";
    }
    {
      mode = [ "n" ];
      key = "<c-j>";
      action = ":wincmd j<CR>";
    }
    {
      mode = [ "n" ];
      key = "<c-h>";
      action = ":wincmd h<CR>";
    }
    {
      mode = [ "n" ];
      key = "<c-l>";
      action = ":wincmd l<CR>";
    }
    {
      mode = [ "n" ];
      key = "gd";
      action = ":lua Snacks.picker.lsp_definitions()<CR>";
      desc = "Goto Definition";
    }
    {
      mode = [ "n" ];
      key = "gD";
      action = ":lua Snacks.picker.lsp_declarations()<CR>";
      desc = "Goto Declaration";
    }
    {
      mode = [ "n" ];
      key = "gr";
      action = ":lua Snacks.picker.lsp_references()<CR>";
      desc = "References";
    }
    {
      mode = [ "n" ];
      key = "gI";
      action = ":lua Snacks.picker.lsp_implementations()<CR>";
      desc = "Goto Implementation";
    }
    {
      mode = [ "n" ];
      key = "gy";
      action = ":lua Snacks.picker.lsp_type_definitions()<CR>";
      desc = "Goto T[y]pe Definition";
    }

    # Splits
    {
      mode = [ "n" ];
      key = "\\";
      action = ":vsplit<CR>";
      desc = "vertical split";
    }
    {
      mode = [ "n" ];
      key = "|";
      action = ":split<CR>";
      desc = "horizontal split";
    }
    {
      mode = [ "n" ];
      key = "<leader>bsx";
      action = "<cmd>close<CR>";
      desc = "close current split window";
    }

    # Tabs
    {
      mode = [ "n" ];
      key = "<Tab>";
      action = ":bn<CR>";
      desc = "next tab";
    }
    {
      mode = [ "n" ];
      key = "<s-Tab>";
      action = ":bp<CR>";
      desc = "previous tab";
    }
    {
      mode = [ "n" ];
      key = "L";
      action = ":bn<CR>";
      desc = "next tab";
    }
    {
      mode = [ "n" ];
      key = "H";
      action = ":bp<CR>";
      desc = "previous tab";
    }
    {
      mode = [ "n" ];
      key = "<leader>bX";
      action = ":bdelete<CR>";
      desc = "all other visible buffers";
    }
    {
      mode = [ "n" ];
      key = "<leader>bx";
      action = ":BufferLineCloseRight<CR>";
      desc = "close right tab";
    }
    {
      mode = [ "n" ];
      key = "<leader>bs";
      action = ":BufferLineSortByTabs<CR>";
      desc = "sorting tabs by name";
    }

    # Make instructions
    {
      mode = [ "n" ];
      key = "<leader>mu";
      action = ":TermExec cmd=\"make up\" direction=float<CR>";
      desc = "start airflow";
    }
    {
      mode = [ "n" ];
      key = "<leader>md";
      action = ":TermExec cmd=\"make down\" direction=float<CR>";
      desc = "stop airflow";
    }
    {
      mode = [ "n" ];
      key = "<leader>mr";
      action = ":terminal cmd=\"make down && make clean && make up\" direction=float<CR>";
      desc = "restart airflow";
    }
    {
      mode = [ "n" ];
      key = "<leader>mb";
      action = ":terminal cmd \"make build/airflow && make build/crawlers && make build/parsers/base && make build/normalizers/base\"<CR>";
      desc = "build base";
    }
    {
      mode = [ "n" ];
      key = "<leader>mo";
      action = ":terminal cmd=\"make build/xporters/couchdb && make build/joiners && make build/operators\" direction=float<CR>";
      desc = "build operators";
    }

    # Terminal
    {
      key = "<leader>tt";
      mode = [ "n" ];
      action = ":lua Snacks.terminal()<CR>";
      silent = true;
      desc = "toggle terminal";
    }
    {
      key = "<C-h>";
      mode = [ "t" ];
      action = ":wincmd h<CR>";
      silent = true;
      desc = "terminal left window navigation";
    }
    {
      key = "<C-j>";
      mode = [ "t" ];
      action = ":wincmd j<CR>";
      silent = true;
      desc = "terminal down window navigation";
    }
    {
      key = "<C-k>";
      mode = [ "t" ];
      action = ":wincmd k<CR>";
      silent = true;
      desc = "terminal up window navigation";
    }
    {
      key = "<C-l>";
      mode = [ "t" ];
      action = ":wincmd l<CR>";
      silent = true;
      desc = "terminal right window navigation";
    }

    # Other
    {
      mode = [ "n" ];
      key = "<leader>un";
      action = ":lua Snacks.notifier.show_history()<CR>";
      desc = "notification history";
    }
    {
      mode = [ "n" ];
      key = "<leader>gg";
      action = ":lua Snacks.lazygit()<CR>";
      desc = "lazygit";
    }
    {
      mode = [ "n" ];
      key = "<leader>cc";
      action = ":CopilotChatToggle<CR>";
      desc = "copilot chat toggle";
    }
    {
      mode = [ "n" ];
      key = "<leader>cm";
      action = ":CopilotChatModels<CR>";
      desc = "copilot chat models";
    }
    {
      mode = [ "n" ];
      key = "<leader>rr";
      action = ":RemoteStart<CR>";
      desc = "start remote connection";
    }
    {
      mode = [ "n" ];
      key = "<leader>rs";
      action = ":RemoteStop<CR>";
      desc = "stop remote connection";
    }
    {
      mode = [ "n" ];
      key = "<leader>ri";
      action = ":RemoteInfo<CR>";
      desc = "remote connection info";
    }
    {
      mode = [ "n" ];
      key = "<leader>ru";
      action = ":RemoteCleanup<CR>";
      desc = "cleanup remote connection";
    }
    {
      mode = [ "n" ];
      key = "<leader>rc";
      action = ":lua require('remote-sshfs.api').connect()<CR>";
      desc = "sshfs connect";
    }
    {
      mode = [ "n" ];
      key = "<leader>rd";
      action = ":lua require('remote-sshfs.api').disconnect()<CR>";
      desc = "sshfs disconnect";
    }
    {
      mode = [ "n" ];
      key = "<leader>re";
      action = ":lua require('remote-sshfs.api').edit()<CR>";
      desc = "sshfs edit connection";
    }
    {
      mode = [ "n" ];
      key = "<leader>ct";
      action = ":CsvViewToggle<CR>";
      desc = "toggle csv view";
    }

    # AI / Claude Code
    {
      mode = [ "n" ];
      key = "<leader>ac";
      action = ":ClaudeCode<CR>";
      desc = "Toggle Claude";
    }
    {
      mode = [ "n" ];
      key = "<leader>af";
      action = ":ClaudeCodeFocus<CR>";
      desc = "Focus Claude";
    }
    {
      mode = [ "n" ];
      key = "<leader>ar";
      action = ":ClaudeCode --resume<CR>";
      desc = "Resume Claude";
    }
    {
      mode = [ "n" ];
      key = "<leader>aC";
      action = ":ClaudeCode --continue<CR>";
      desc = "Continue Claude";
    }
    {
      mode = [ "n" ];
      key = "<leader>am";
      action = ":ClaudeCodeSelectModel<CR>";
      desc = "Select Claude model";
    }
    {
      mode = [ "n" ];
      key = "<leader>ab";
      action = ":ClaudeCodeAdd %<CR>";
      desc = "Add current buffer";
    }
    {
      mode = [ "v" ];
      key = "<leader>as";
      action = ":ClaudeCodeSend<CR>";
      desc = "Send to Claude";
    }
    {
      mode = [ "n" ];
      key = "<leader>aa";
      action = ":ClaudeCodeDiffAccept<CR>";
      desc = "Accept diff";
    }
    {
      mode = [ "n" ];
      key = "<leader>ad";
      action = ":ClaudeCodeDiffDeny<CR>";
      desc = "Deny diff";
    }
  ];
}
