{ pkgs, ... }:

{
  startPlugins = [
    pkgs.vimPlugins.blink-cmp-copilot
  ];
  extraPlugins = {
    kulala-nvim = {
      package = pkgs.vimPlugins.kulala-nvim;
      setup = ''
        require('kulala').setup({
          global_keymaps = true,
          global_keymaps_prefix = '<leader>r',
        })
      '';
    };
    telescope-fzf-native-nvim = {
      package = pkgs.vimPlugins.telescope-fzf-native-nvim;
    };
    copilot-chat = {
      package = pkgs.vimPlugins.CopilotChat-nvim;
      setup = "require('CopilotChat').setup {
          window = {
            layout = 'vertical',
            width = 0.4,
          },
          auto_insert_mode = false,
        }";
    };
  };
}
