{
  plugins.treesitter-textobjects = {
    enable = true;
    select = {
      enable = true;
      lookahead = true;
      keymaps = {
        "aa" = "@parameter.outer";
        "ia" = "@parameter.inner";
        "af" = "@function.outer";
        "if" = "@function.inner";
        "ac" = "@class.outer";
        "ic" = "@class.inner";
        "ii" = "@conditional.inner";
        "ai" = "@conditional.outer";
        "il" = "@loop.inner";
        "al" = "@loop.outer";
        "at" = "@comment.outer";
      };
    };
    move = {
      enable = false;
      gotoNextStart = {
        "]f" = "@function.outer";
        "]c" = "@class.outer";
      };
      gotoNextEnd = {
        "]F" = "@function.outer";
        "]C" = "@class.outer";
      };
      gotoPreviousStart = {
        "[f" = "@function.outer";
        "[c" = "@class.outer";
      };
      gotoPreviousEnd = {
        "[F" = "@function.outer";
        "[C" = "@class.outer";
      };
    };
    swap = {
      enable = true;
      swapNext = { "<leader>a" = "@parameters.inner"; };
      swapPrevious = { "<leader>A" = "@parameter.outer"; };
    };
  };
}
