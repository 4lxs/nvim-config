{
  colorschemes.catppuccin = {
    enable = true;
    settings = {
      background = {
        light = "latte";
        dark = "mocha";
      };
      flavour = "mocha"; # "latte", "mocha", "frappe", "macchiato" or raw lua code
      disable_bold = false;
      disable_italic = false;
      disable_underline = false;
      transparent_background = true;
      integrations = {
        harpoon = true;
        which_key = true;
        treesitter = true;
        fidget = true;
        treesitter_context = true;
        telescope.enabled = true;
        flash = true;
        indent_blankline.enabled = true;
        lsp_trouble = true;
        native_lsp = {
          enabled = true;
        };
      };
    };
  };
  highlightOverride = {
    DiffAdd.fg = "green";
    DiffChange.fg = "orange";
    DiffDelete.fg = "red";
  };
}
