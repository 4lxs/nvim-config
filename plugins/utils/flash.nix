{lib, ...}: {
  plugins.flash = {
    enable = true;
    search = {
      mode = "fuzzy";
    };
    modes = {
      search.enabled = false;
    };
    label = {
      uppercase = false;
    };
  };

  keymaps = let
    normal =
      lib.mapAttrsToList
      (key: action: {
        mode = "n";
        inherit action key;
      })
      {
        "s" = {__raw = ''function() require("flash").jump() end'';};
        "S" = {__raw = ''function() require("flash").treesitter() end'';};
      };
    visual =
      lib.mapAttrsToList
      (key: action: {
        mode = "x";
        inherit action key;
      })
      {
        "s" = {__raw = ''function() require("flash").jump() end'';};
        "S" = {__raw = ''function() require("flash").treesitter() end'';};
        "r" = {__raw = ''function() require("flash").remote() end'';};
      };
    operator =
      lib.mapAttrsToList
      (key: action: {
        mode = "o";
        inherit action key;
      })
      {
        "s" = {__raw = ''function() require("flash").jump() end'';};
        "S" = {__raw = ''function() require("flash").treesitter() end'';};
        "r" = {__raw = ''function() require("flash").remote() end'';};
        "R" = {__raw = ''function() require("flash").treesitter_search() end'';};
      };
    modeC =
      lib.mapAttrsToList
      (key: action: {
        mode = "c";
        inherit action key;
      })
      {
        "<c-s>" = {__raw = ''function() require("flash").toggle() end'';};
      };
  in
    normal ++ visual ++ operator ++ modeC;
}
