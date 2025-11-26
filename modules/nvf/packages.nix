{ pkgs, ... }:

{
  extraPackages = with pkgs; [
    vscode-langservers-extracted
    yaml-language-server
    bash-language-server
    lua-language-server
    tree-sitter
    pyright
    ripgrep
    figlet
    lolcat
    zoxide
    nodejs
    nixd
    sqls
    git
    fzf
    fd
  ];
}
