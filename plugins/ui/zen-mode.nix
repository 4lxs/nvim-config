{ svlib, ... }:
{
  plugins.zen-mode = {
    enable = true;
  };

  keymaps = svlib.createKeymaps "n" {
    "<leader>z" = {
      action = "<cmd>ZenMode<cr>";
      desc = "Zen Mode";
    };
  };
}
