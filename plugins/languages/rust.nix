{
  plugins = {
    rustaceanvim = {
      enable = true;
      server = {
        settings = {
          check = {
            command = "clippy";
            extraArgs = [ "--no-deps" ];
            features = "all";
          };
          cargo = { features = "all"; };
          procMacro = { enable = true; };
        };
      };
    };
    lsp.servers = {
      rust-analyzer = {
        enable = true;
        installCargo = true;
        installRustc = true;
      };
      taplo = { enable = true; };
    };
    fidget.progress.display.overrides.rust_analyzer = {
      name = "rust-analyzer";
    };
    conform-nvim.formattersByFt.rust = [ "rustfmt" ];
  };
}
