{
  plugins.gitsigns.enable = true;
  plugins.lualine = {
    enable = true;

    settings = {
      globalstatus = true;
      disabledFiletypes.statusline = [
        "dashboard"
        "alpha"
        "starter"
      ];
      theme = "auto";
      alwaysDivideMiddle = true;

      extensions = [
        "oil"
        "fugitive"
        "trouble"
      ];

      sections = {
        lualine_a = [ "mode" ];
        lualine_b = [ "" ];
        lualine_c = [
          {
            name = "diagnostics";
            extraConfig = {
              icons = {
                Error = " ";
                Warn = " ";
                Hint = " ";
                Info = " ";
              };
            };
          }
          {
            name = "filetype";
            padding = {
              left = 1;
              right = 0;
            };
            extraConfig = {
              icon_only = true;
            };
          }
          {
            name = "filename";
            separator.left = "";
            extraConfig = {
              path = 1;
            };
          }
        ];

        lualine_x = [
          {
            name = "diff";
            extraConfig = {
              symbols = {
                added = " ";
                modified = " ";
                removed = " ";
              };
              source.__raw = ''
                function()
                  local gitsigns = vim.b.gitsigns_status_dict
                  if gitsigns then
                    return {
                      added = gitsigns.added,
                      modified = gitsigns.changed,
                      removed = gitsigns.removed,
                    }
                  end
                end
              '';
            };
          }
        ];
        lualine_y = [
          {
            name = "searchcount";
            padding = {
              left = 1;
              right = 0;
            };
            separator.right = " ";
          }
          {
            name = "progress";
            separator.right = " ";
          }
          { name = "location"; }
        ];
        lualine_z = [ "" ];
      };
    };
  };
}
