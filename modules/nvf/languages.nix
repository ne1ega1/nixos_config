{
  languages = {
    enableDAP = true;
    enableFormat = false;
    enableTreesitter = true;
    enableExtraDiagnostics = true;
    sql.enable = true;
    bash.enable = true;
    css.enable = true;
    rust.enable = true;
    yaml.enable = true;
    nix = {
      enable = true;
      treesitter.enable = true;
      extraDiagnostics.enable = true;
      format = {
        enable = true;
        type = [ "nixfmt" ];
      };
      lsp = {
        enable = true;
        servers = [ "nixd" ];
      };
    };
    python = {
      enable = true;
      dap.enable = true;
      format.enable = true;
      treesitter.enable = true;
      lsp = {
        enable = true;
        servers = [ "pyright" ];
      };
    };
    lua = {
      enable = true;
      lsp.lazydev.enable = true;
    };
    html = {
      enable = true;
      treesitter = {
        enable = true;
        autotagHtml = true;
      };
    };
    markdown = {
      enable = true;
      format = {
        enable = true;
        extraFiletypes = [ "mdx" ];
      };
      lsp.enable = true;
      treesitter.enable = true;
      extensions.markview-nvim.enable = true;
    };
  };
}
