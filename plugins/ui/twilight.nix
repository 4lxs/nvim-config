{ svlib, ... }:
{
  plugins.twilight = {
    enable = true;
    settings = {
      expand = [ "function" "method" "class" "class_specifier" "function_definition" "table" ];
    };
  };

  keymaps = svlib.createKeymaps "n" {
    "<leader>ut" = {
      action = "<cmd>Twilight<cr>";
      desc = "toggle twilight";
    };
  };
}
