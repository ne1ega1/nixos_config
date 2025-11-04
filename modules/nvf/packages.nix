{ pkgs, ... }:

{
  extraPackages = with pkgs; [
    vscode-langservers-extracted
    yaml-language-server
    bash-language-server
    lua-language-server
    pyright
    ripgrep
    figlet
    lolcat
    zoxide
    nixd
    sqls
    git
    fzf
    fd
  ];
}
