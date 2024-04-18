{ svlib, ... }:
{
  plugins.twilight = {
    enable = true;
  };

  keymaps = svlib.createKeymaps "n" {
    "<leader>ut" = {
      action = "<cmd>Twilight<cr>";
      desc = "toggle twilight";
    };
  };
}
