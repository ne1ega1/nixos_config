{
  mini = {
    ai.enable = true;
    icons.enable = true;
    pairs = {
      enable = true;
      setupOpts = {
        mappings = {
          "'" = {
            action = "closeopen";
            pair = "''";
            neigh_pattern = "^[^%a\\\\].";
            register.cr = false;
          };
        };
      };
    };
    surround = {
      enable = true;
      setupOpts = {
        mappings = {
          add = "sa";
          delete = "sd";
          find = "sf";
          find_left = "sF";
          highlight = "sh";
          replace = "sr";
          update_n_lines = "sn";
        };
      };
    };
  };
}
