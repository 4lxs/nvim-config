{ svlib, ... }:
{
  plugins.zen-mode = {
    enable = true;
    settings = {
      plugins.twilight.enabled = true;
    };
  };

  keymaps = svlib.createKeymaps "n" {
    "<leader>uz" = {
      action = "<cmd>ZenMode<cr>";
      desc = "Zen Mode";
    };
  };
}
