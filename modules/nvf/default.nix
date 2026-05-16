{ lib, pkgs, ... }:

{
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        viAlias = false;
        vimAlias = true;
        undoFile.enable = true;
      }
      // import ./ui.nix
      // import ./dap.nix
      // import ./mini.nix
      // import ./blink.nix
      // import ./snacks.nix
      // import ./session.nix
      // import ./options.nix
      // import ./keymaps.nix
      // import ./gitsigns.nix
      // import ./neo-tree.nix
      // import ./clipboard.nix
      // import ./languages.nix
      // import ./bufferline.nix
      // (import ./lsp.nix { inherit lib; })
      // (import ./which-key.nix { inherit lib; })
      // (import ./formatter.nix { inherit lib; })
      // (import ./packages.nix { inherit pkgs; })
      // (import ./telescope.nix { inherit pkgs; })
      // (import ./statusline.nix { inherit lib; })
      // (import ./treesitter.nix { inherit pkgs; })
      // (import ./extra_plugins.nix { inherit pkgs; });
    };
  };
}
