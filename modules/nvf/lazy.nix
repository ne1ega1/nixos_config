{ pkgs, ... }:

{
  lazy.plugins = {
    "nui.nvim" = {
      package = pkgs.vimPlugins.nui-nvim;
      setupModule = "nui-nvim";
      lazy = false;
    };
  };
}
