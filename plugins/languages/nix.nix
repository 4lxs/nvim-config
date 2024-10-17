{ pkgs, ... }:
{
  plugins = {
    nix.enable = true;
    lsp.servers.nil_ls.enable = true;
    conform-nvim = {
      # settings.formatters.nixfmt.command = "${pkgs.nixfmt-rfc-style}/bin/nixfmt";
      settings.formatters_by_ft.nix = [ ["alejandra"] ["nixfmt"] ];
    };
    lint = {
      lintersByFt.nix = [ "statix" ];
      linters.statix.cmd = "${pkgs.statix}/bin/statix";
    };
  };
}
