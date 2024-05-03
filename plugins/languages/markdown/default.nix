{ pkgs, ... }:
{
  imports = [
    ./markdown-preview.nix
    # ./mkdnflow.nix
    ./vim-markdown.nix
    ./headlines.nix
    ./vim-table-mode.nix
  ];

  plugins = {
    conform-nvim = {
      formatters = {
        prettierd.command = "${pkgs.prettierd}/bin/prettierd";
        markdownlint.command = "${pkgs.markdownlint-cli}/bin/markdownlint";
      };
      formattersByFt.markdown = [
        [
          "prettierd"
          "prettier"
          "markdownlint"
        ]
      ];
    };
    lint = {
      linters.markdownlint.cmd = "${pkgs.markdownlint-cli}/bin/markdownlint";
      lintersByFt.markdown = [ "markdownlint" ];
    };
    lsp.servers.marksman = {
      enable = true;
    };
  };
}
