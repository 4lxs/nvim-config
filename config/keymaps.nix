{ lib, svlib, ... }:
{
  globals = {
    mapleader = " ";
    maplocalleader = "\\";
  };
  keymaps =
    svlib.createKeymaps "n" {
      # prev buffer
      "<tab>" = "<cmd>b#<cr>";

      "<leader>bd" = {
        action.__raw = ''
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
        desc = "Close buffer";
      };

      # Clear search with <esc>
      "<esc>" = "<cmd>noh<cr><esc>";

      # i'm a normie
      "<c-s>" = "<cmd>w<cr>";

      # gf, but create file if it doesn't exist TODO: make this work
      # "gF" = "<cmd>e <cfile><cr>";

      "[e" = {
        action.__raw = ''function() vim.diagnostic.goto_prev({severity = vim.diagnostic.severity["ERROR"]}) end'';
        desc = "Prev Error";
      };

      "]e" = {
        action.__raw = ''function() vim.diagnostic.goto_next({severity = vim.diagnostic.severity["ERROR"]}) end'';
        desc = "Next Error";
      };

      "[w" = {
        action.__raw = ''function() vim.diagnostic.goto_prev({severity = vim.diagnostic.severity["WARN"]}) end'';
        desc = "Prev Warning";
      };

      "]w" = {
        action.__raw = ''function() vim.diagnostic.goto_next({severity = vim.diagnostic.severity["WARN"]}) end'';
        desc = "Next Warning";
      };

      "<leader>tc" = {
        action = "<cmd>tabc<cr>";
        desc = "Close tab";
      };
    }
    ++ svlib.createKeymaps "i" {
      # tab should be for completion ONLY
      "<c-x>" = "<tab>";

      # Clear search with <esc>
      "<esc>" = "<cmd>noh<cr><esc>";

      # Resize windows with arrow keys
      "<c-up>" = "<cmd>resize +2<cr>";
      "<c-down>" = "<cmd>resize -2<cr>";
      "<c-left>" = "<cmd>vertical resize +2<cr>";
      "<c-right>" = "<cmd>vertical resize -2<cr>";

      # sometimes i just want to delete autopair plugin
      "<c-l>" = "<right><bs>";

      # "]]" = {
      #   action = "<cmd>tag <cword><cr>";
      #   desc = "follow tag";
      # };
    }
    ++ svlib.createKeymaps "x" {
      # better indenting
      ">" = ">gv";
      "<" = "<gv";
      # move selected line / block of text in visual mode
      "K" = ":m '<-2<CR>gv=gv";
      "J" = ":m '>+1<CR>gv=gv";
    };
}
