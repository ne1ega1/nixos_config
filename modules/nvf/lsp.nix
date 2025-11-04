{ lib, ... }:

{
  lsp = {
    enable = true;
    formatOnSave = false;
    trouble.enable = true;
    lspconfig.enable = true;
    inlayHints.enable = true;
    servers = {
      nixd.enable = true;
      qmlls.enable = true;
      jsonls.enable = true;
      pyright.enable = true;
    };
  };
  diagnostics = {
    enable = true;
    config = {
      signs.text = [ "󰅚 " "󰀪 " "󰌶 " "󰛩 " ];
      virtual_text = {
        format = lib.generators.mkLuaInline ''
          function(diagnostic)
            return string.format("%s (%s)", diagnostic.message, diagnostic.source)
          end
        '';
      };
    };
  };
}
