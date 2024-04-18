{ svlib, pkgs, ... }:
{
  extraPlugins = with pkgs.vimPlugins; [ vim-table-mode ];

  extraConfigLua = '''';

  keymaps = svlib.createKeymaps "n" { };
}
