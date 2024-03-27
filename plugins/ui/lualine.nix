{
  plugins.gitsigns.enable = true;
  plugins.lualine = {
    enable = true;

    globalstatus = true;
    disabledFiletypes.statusline = [ "dashboard" "alpha" "starter" ];
    theme = "auto";
    alwaysDivideMiddle = true;

    extensions = [ "fzf" "oil" ];

    sections = {
      lualine_a = [ "mode" ];
      lualine_b = [ "" ];
      lualine_c = [
        # TODO: LazyVim.lualine.root_dir(),
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
        # TODO: LazyVim.lualine.pretty_path()
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
          name = "progress";
          separator = { right = " "; };
          padding = { left = 1; right = 0; };
        }
        {
          name = "location";
          padding = { left = 0; right = 1; };
        }
      ];
      lualine_z = [ "" ];
    };
  };
}
