{ lib, ... }:

{
  binds.whichKey = {
    enable = true;
    register = lib.mkForce {
      "<leader>b" = "buffers";
      "<leader>c" = "code";
      "<leader>d" = "debugger";
      "<leader>f" = "find";
      "<leader>g" = "git";
      "<leader>h" = "gitsigns";
      "<leader>l" = "lsp";
      "<leader>m" = "make";
      "<leader>r" = "kulala";
      "<leader>s" = "session";
      "<leader>t" = "terminal";
      "<leader>u" = "ui";
      "<leader>x" = "trouble";
    };
    setupOpts = {
      preset = "helix";
      icons = {
        rules = [
          {
            pattern = "trouble";
            icon = "󱖫";
            color = "red";
          }
          {
            pattern = "focus";
            icon = "";
            color = "blue";
          }
          {
            pattern = "save";
            icon = "";
            color = "green";
          }
          {
            pattern = "zoxide";
            icon = "";
            color = "orange";
          }
          {
            pattern = "lsp";
            icon = "󰿘";
            color = "blue";
          }
          {
            pattern = "make";
            icon = "󰁨";
            color = "orange";
          }
        ];
      };
    };
  };
}
