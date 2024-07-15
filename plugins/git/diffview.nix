{ svlib, ... }:
{
  plugins.diffview = {
    enable = true;
  };
  keymaps = svlib.createKeymaps "n" { "<leader>gd" = ":DiffviewOpen<CR>"; };
  plugins.octo = {
    enable = true;
    settings.picker = "fzf-lua";
  };
}
