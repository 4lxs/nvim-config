{ svlib, pkgs, ... }:
{
  extraPlugins = with pkgs.vimPlugins; [ vim-markdown ];

  extraConfigLua = ''
    vim.g.vim_markdown_math = 1
    vim.g.vim_markdown_frontmatter = 1
    vim.g.vim_markdown_strikethrough = 1
  '';

  keymaps = svlib.createKeymaps "n" {
    "<leader>m>" = {
      action = "<cmd>HeaderIncrease<cr>";
      desc = "Increase header level";
    };
    "<leader>m<" = {
      action = "<cmd>HeaderDecrease<cr>";
      desc = "Decrease header level";
    };
    "<leader>mt" = {
      action = "<cmd>Toc<cr>";
      desc = "open table of contents";
    };
  };
}
