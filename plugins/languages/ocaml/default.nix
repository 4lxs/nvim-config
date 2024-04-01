{ pkgs, ... }: {
  plugins.lsp.servers.ocamllsp = { enable = true; };
  plugins.conform-nvim = {
    formatters.ocamlformat.command = "${pkgs.ocamlformat}/bin/ocamlformat";
    formattersByFt.ocaml = [ "ocamlformat" ];
  };
}
