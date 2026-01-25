{ pkgs, ... }:

let
  kulala_http = pkgs.tree-sitter.buildGrammar {
    language = "kulala_http";
    version = "5.3.3";
    location = "lua/tree-sitter";
    src = pkgs.fetchFromGitHub {
      owner = "mistweaverco";
      repo = "kulala.nvim";
      rev = "5d3916195a97928b8f9b79d96029f37d19ba866d";
      hash = "sha256-rz2dynlMkxTxKzfM36vC6KMgnuJ/hj+QTXTW7NG5esY=";
    };
  };
in
{
  treesitter = {
    enable = true;
    # grammars = pkgs.tree-sitter.allGrammars ++ [ kulala_http ];
    grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      kulala_http
      dockerfile
      javascript
      git_rebase
      markdown
      python
      yaml
      html
      toml
      json
      bash
      fish
      lua
      nix
      sql
      vim
      css
      csv
      tsv
    ];
  };
}
