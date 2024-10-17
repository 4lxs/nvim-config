{ pkgs, ... }:
{
  plugins.lsp.servers.ocamllsp = {
    enable = true;
    package = pkgs.ocamlPackages.lsp;
  };
  plugins.conform-nvim = {
    settings.formatters.ocamlformat.command = "${pkgs.ocamlformat}/bin/ocamlformat";
    settings.formatters_by_ft.ocaml = [ "ocamlformat" ];
  };
}
