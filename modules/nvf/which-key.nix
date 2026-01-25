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
      "<leader>k" = "kulala";
      "<leader>l" = "lsp";
      "<leader>m" = "make";
      "<leader>r" = "remote";
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
            pattern = "git";
            color = "red";
          }
          {
            pattern = "gitsigns";
            color = "red";
          }
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
            pattern = "lsp";
            icon = "󰿘";
            color = "blue";
          }
          {
            pattern = "make";
            icon = "󰁨";
            color = "green";
          }
          {
            pattern = "kulala";
            icon = "󱜿";
            color = "blue";
          }
          {
            pattern = "remote";
            icon = "󰢹";
            color = "green";
          }
        ];
      };
    };
  };
}
