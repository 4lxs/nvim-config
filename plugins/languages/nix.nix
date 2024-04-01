{ pkgs, ... }: {
  plugins = {
    nix.enable = true;
    lsp.servers.nil_ls.enable = true;
    conform-nvim = {
      formatters.nixfmt.command = "${pkgs.nixfmt}/bin/nixfmt";
      formattersByFt.nix = [ "nixfmt" ];
    };
    lint = {
      lintersByFt.nix = [ "statix" ];
      linters.statix.cmd = "${pkgs.statix}/bin/statix";
    };
  };
}
