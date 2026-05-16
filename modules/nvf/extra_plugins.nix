{ pkgs, ... }:

{
  startPlugins = with pkgs.vimPlugins; [
    blink-cmp-copilot
  ];
  extraPlugins = with pkgs.vimPlugins; {
    claudecode = {
      package = claudecode-nvim;
      setup = ''
        require('claudecode').setup(
          {
            terminal_cmd = "/etc/profiles/per-user/hanzo/bin/claude",
          }
        )
      '';
    };
    nvim-dap-virtual-text = {
      package = nvim-dap-virtual-text;
    };
    nui-nvim = {
      package = nui-nvim;
    };
    csvview = {
      package = csvview-nvim;
      setup = ''
        require('csvview').setup(
          {
            view = {
              display_mode = "border",
            },
          }
        )
      '';
    };
    remote-nvim = {
      package = remote-nvim-nvim;
      setup = ''
        require("remote-nvim").setup()
      '';
    };
    remote-sshfs = {
      package = remote-sshfs-nvim;
      setup = ''
        require("remote-sshfs").setup()
      '';
    };
    kulala-nvim = {
      package = kulala-nvim;
      setup = ''
        require('kulala').setup(
          {
            global_keymaps = true,
            global_keymaps_prefix = '<leader>k',
          }
        )
      '';
    };
    telescope-fzf-native-nvim = {
      package = telescope-fzf-native-nvim;
    };
  };
}
