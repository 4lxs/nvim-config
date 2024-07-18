{ svlib, ... }:
{
  plugins.flash = {
    enable = true;
    settings = {
      modes = {
        search.enabled = false;
        char.enabled = true;
      };
    };
  };

  keymaps =
    svlib.createKeymaps "n" {
      "s" = {
        action.__raw = ''function() require("flash").jump() end'';
      };
      "S" = {
        action.__raw = ''function() require("flash").treesitter() end'';
      };
    }
    ++ svlib.createKeymaps "x" {
      "s" = {
        action.__raw = ''function() require("flash").jump() end'';
      };
      "S" = {
        action.__raw = ''function() require("flash").treesitter() end'';
      };
      "r" = {
        action.__raw = ''function() require("flash").remote() end'';
      };
    }
    ++ svlib.createKeymaps "o" {
      "s" = {
        action.__raw = ''function() require("flash").jump() end'';
      };
      "S" = {
        action.__raw = ''function() require("flash").treesitter() end'';
      };
      "r" = {
        action.__raw = ''function() require("flash").remote() end'';
      };
      "R" = {
        action.__raw = ''function() require("flash").treesitter_search() end'';
      };
    }
    ++ svlib.createKeymaps "c" {
      "<c-s>" = {
        action.__raw = ''function() require("flash").toggle() end'';
      };
    };
}
