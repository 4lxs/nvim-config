{ pkgs, ... }:
{
  plugins = {
    nix.enable = true;
    lsp.servers.nil_ls.enable = true;
    conform-nvim = {
      # formatters.nixfmt.command = "${pkgs.nixfmt-rfc-style}/bin/nixfmt";
      formattersByFt.nix = [ ["alejandra"] ["nixfmt"] ];
    };
    lint = {
      lintersByFt.nix = [ "statix" ];
      linters.statix.cmd = "${pkgs.statix}/bin/statix";
    };
  };
}
