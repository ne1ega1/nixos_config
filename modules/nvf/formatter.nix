{ lib, ... }:

with lib;

{
  formatter = {
    conform-nvim = {
      enable = true;
      setupOpts = {
        formatters = {
          ruff_format = {
            prepend_args = [
              "--config"
              "format.skip-magic-trailing-comma=true"
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
            python = [ "ruff_format" ];
          };
      };
    };
  };
}
