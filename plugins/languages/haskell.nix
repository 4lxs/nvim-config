{ pkgs, ... }:
{
  plugins.lsp.servers.hls = {
    enable = true;
    # installGhc = true;
    # package = pkgs.haskellPackages.hls;
  };
  plugins.conform-nvim = {
    settings.formatters.ormolu.command = "${pkgs.ormolu}/bin/ormolu";
    settings.formatters_by_ft.haskell = [ "ormolu" ];
  };
}
