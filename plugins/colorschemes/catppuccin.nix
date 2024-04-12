{
  colorschemes.catppuccin = {
    enable = true;
    background = {
      light = "latte";
      dark = "mocha";
    };
    flavour = "mocha"; # "latte", "mocha", "frappe", "macchiato" or raw lua code
    disableBold = false;
    disableItalic = false;
    disableUnderline = false;
    transparentBackground = true;
    integrations = {
      alpha = true;
      cmp = true;
      noice = true;
      notify = true;
      harpoon = true;
      gitsigns = true;
      which_key = true;
      illuminate.enabled = true;
      treesitter = true;
      fidget = true;
      treesitter_context = true;
      telescope.enabled = true;
      flash = true;
      indent_blankline.enabled = true;
      mini.enabled = true;
      markdown = true;
      lsp_trouble = true;
      native_lsp = {
        enabled = true;
        inlay_hints = {
          background = true;
        };
        underlines = {
          errors = [ "underline" ];
          hints = [ "underline" ];
          information = [ "underline" ];
          warnings = [ "underline" ];
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
