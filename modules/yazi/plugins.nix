{ pkgs, inputs, ... }:

{
  programs.yazi.plugins = with pkgs; {
    git = yaziPlugins.git;
    diff = yaziPlugins.diff;
    lsar = yaziPlugins.lsar;
    sudo = yaziPlugins.sudo;
    piper = yaziPlugins.piper;
    chmod = yaziPlugins.chmod;
    mount = yaziPlugins.mount;
    yatline = yaziPlugins.yatline;
    full-border = yaziPlugins.full-border;
    smart-filter = yaziPlugins.smart-filter;
    yatline-catppuccin = yaziPlugins.yatline-catppuccin;
    wl-clipboard = toString inputs.yazi-clipboard;
    compress = toString inputs.yazi-compress;
    what-size = toString inputs.yazi-size;
    office = toString inputs.yazi-office;
  };
}
