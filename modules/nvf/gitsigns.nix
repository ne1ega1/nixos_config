{
  git.gitsigns = {
    enable = true;
    setupOpts = {
      signs = {
        add = { text = "▎"; };
        change = { text = "▎"; };
        delete = { text = ""; };
        topdelete = { text = ""; };
        changedelete = { text = "▎"; };
        untracked = { text = "▎"; };
      };
      signs_staged = {
        add = { text = "▎"; };
        change = { text = "▎"; };
        delete = { text = ""; };
        topdelete = { text = ""; };
        changedelete = { text = "▎"; };
      };
      mappings = {
        previewHunk = "<leader>ghp";
        blameLine = "<leader>ghb";
        diffThis = "<leader>ghd";
        resetBuffer = "<leader>ghR";
        resetHunk = "<leader>ghr";
        stageBuffer = "<leader>ghS";
        stageHunk = "<leader>ghs";
        undoStageHunk = "<leader>ghu";
      };
    };
  };
}
