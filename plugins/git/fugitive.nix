{ svlib, ... }:
{
  plugins.fugitive = {
    enable = true;
  };

  keymaps = svlib.createKeymaps "n" {
    "<leader>gg" = "<cmd>Git<cr>";
    # "<leader>gd" = "<cmd>Gvdiff<cr>";
    "<leader>ga" = "<cmd>Gwrite<cr>";
    "<leader>gr" = "<cmd>Gread<cr>";
    "<leader>gb" = "<cmd>Git blame<cr>";
  };
}
