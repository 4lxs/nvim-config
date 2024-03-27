{lib, ...}: {
  globals = {
    mapleader = " ";
    maplocalleader = "\\";
  };
  keymaps = let
    normal =
      lib.mapAttrsToList
      (key: action: {
        mode = "n";
        options = {
          noremap = true;
          silent = true;
        };
        inherit action key;
      })
      {
        # prev buffer
        "<tab>" = "<cmd>b#<cr>";

        # close buffer
        "<leader>bd" = {
          __raw = ''
            function()
              local bd = require("mini.bufremove").delete
              if vim.bo.modified then
                local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
                if choice == 1 then -- Yes
                  vim.cmd.write()
                  bd(0)
                elseif choice == 2 then -- No
                  bd(0, true)
                end
              else
                bd(0)
              end
            end
          '';
        };

        # Clear search with <esc>
        "<esc>" = "<cmd>noh<cr><esc>";

        # i'm a normie
        "<c-s>" = "<cmd>w<cr>";

        # gf, but create file if it doesn't exist
        # "gF" = "<cmd>e <cfile><cr>";
      };
    insert =
      lib.mapAttrsToList
      (key: action: {
        mode = "i";
        options = {
          noremap = true;
          silent = true;
        };
        inherit action key;
      })
      {
        # tab is for completion ONLY
        "<c-x>" = "<tab>";

        # Clear search with <esc>
        "<esc>" = "<cmd>noh<cr><esc>";

        # Resize windows with arrow keys
        "<c-up>" = "<cmd>resize +2<cr>";
        "<c-down>" = "<cmd>resize -2<cr>";
        "<c-left>" = "<cmd>vertical resize +2<cr>";
        "<c-right>" = "<cmd>vertical resize -2<cr>";
      };
    visual =
      lib.mapAttrsToList
      (key: action: {
        mode = "x";
        options = {
          noremap = true;
          silent = true;
        };
        inherit action key;
      })
      {
        # better indenting
        ">" = ">gv";
        "<" = "<gv";

        # move selected line / block of text in visual mode
        "K" = ":m '<-2<CR>gv=gv";
        "J" = ":m '>+1<CR>gv=gv";
      };
  in
    normal ++ insert ++ visual;
}
