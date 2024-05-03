{ pkgs, ... }:
{
  plugins = {
    lint = {
      linters.jsonlint.cmd = "${pkgs.nodePackages_latest.jsonlint}/bin/jsonlint";
      lintersByFt.json = [ "jsonlint" ];
    };
    lsp.servers.jsonls = {
      enable = true;
    };
  };
}
