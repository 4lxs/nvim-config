{ pkgs, ... }:
{
  imports = [
    ./markdown-preview.nix
    ./mkdnflow.nix
  ];

  plugins = {
    conform-nvim.formattersByFt.markdown = [
      [
        "prettierd"
        "prettier"
      ]
    ];
    lint.lintersByFt.markdown = [ "markdownlint" ];
    lsp.servers.marksman = {
      enable = true;
    };
  };
  extraPlugins = with pkgs.vimPlugins; [ headlines-nvim ];

  extraConfigLua = ''
    require('headlines').setup()
  '';
}
