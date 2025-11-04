{ lib, ... }:

with lib;

{
  formatter = {
    conform-nvim = {
      enable = true;
      setupOpts = {
        formatters = {
          prettierd = {
            prepend_args = [
              "--single-quote"
              "--trailing-comma" "none"
            ];
          };
        };
        formatters_by_ft =
          (genAttrs [
            "css"
            "vue"
            "html"
            "scss"
            "less"
            "yaml"
            "json"
            "jsonc"
            "json5"
            "astro"
            "python"
            "svelte"
            "graphql"
            "markdown"
            "javascript"
            "typescript"
            "javascriptreact"
            "typescriptreact"
          ] (n: [ "prettierd" ]))
          // {
            nix = [ "nixfmt" ];
          };
      };
    };
  };
}
