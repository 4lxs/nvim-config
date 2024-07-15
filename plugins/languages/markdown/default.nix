{ pkgs, lib, ... }:
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
        markdownlint-cli2.command = "${pkgs.markdownlint-cli2}/bin/markdownlint";
      };
      formattersByFt.markdown = [
        [
          "prettierd"
          "prettier"
          "markdownlint-cli2"
        ]
      ];
    };
    lint = {
      customLinters.mdl = {
        cmd = "${pkgs.markdownlint-cli2}/bin/markdownlint-cli2";
        ignore_exitcode = true;
        stream = "stderr";
        parser = ''
          require("lint.parser").from_errorformat(efm, {
            source = "markdownlint",
            severity = vim.diagnostic.severity.WARN,
          })'';
      };
      lintersByFt.markdown = [ "mdl" ];
    };
    lsp.servers.marksman = {
      enable = true;
    };
  };

  autoCmd = [
    {
      event = [ "FileType" ];
      pattern = [ "markdown" ];
      command = "setlocal tw=80";
    }
  ];
}
