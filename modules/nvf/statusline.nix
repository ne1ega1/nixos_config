{ lib, ... }:

{
  statusline.lualine = {
    enable = true;
    theme = lib.mkForce "gruvbox-material";
    componentSeparator = {
      left = "";
      right = "";
    };
    sectionSeparator = {
      left = "";
      right = "";
    };
    activeSection = {
      a = [
        ''
          {
            "mode",
            icons_enabled = true,
            separator = { left = '', right_padding = 2 },
          }
        ''
        ''
          {
            "",
            draw_empty = true,
            separator = { left = '', right = '' }
          }
        ''
      ];
      b = [
        ''
          {
            "filetype",
            colored = true,
            icon_only = true,
            icon = { align = 'left' }
          }
        ''
        ''
          {
            "filename",
            symbols = { modified = ' ', readonly = ' ' },
            separator = { right = '' }
          }
        ''
        ''
          {
            "",
            draw_empty = true,
            separator = { left = '', right = '' }
          }
        ''
      ];
      y = [
        ''
          {
            "",
            draw_empty = true,
            separator = { left = '', right = '' }
          }
        ''
        ''
          {
            'searchcount',
            maxcount = 999,
            timeout = 120,
            separator = { left = '' }
          }
        ''
        ''
          {
            "branch",
            icon = ' •',
            separator = { left = '' }
          }
        ''
      ];
      z = [
        ''
          {
            "",
            draw_empty = true,
            separator = { left = '', right = '' }
          }
        ''
        ''
          {
            "progress",
            separator = { left = '' }
          }
        ''
        ''
          {"location"}
        ''
        ''
          {
            "fileformat",
            color = {fg='black'},
            separator = { right = '' },
            symbols = {
              unix = '', -- e712
              dos = '',  -- e70f
              mac = '',  -- e711
            }
          }
        ''
      ];
    };
  };
}
