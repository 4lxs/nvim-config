{
  imports = [
    ./markdown-preview.nix
    # ./mkdnflow.nix
    ./vim-markdown.nix
    ./headlines.nix
    ./vim-table-mode.nix
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
}
