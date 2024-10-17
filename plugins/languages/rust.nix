{
  plugins = {
    rustaceanvim = {
      enable = true;
    };
    lsp.servers = {
      # rust-analyzer = {
      #   enable = true;
      #   installCargo = true;
      #   installRustc = true;
      # };
      taplo = {
        enable = true;
      };
    };
    fidget.progress.display.overrides.rust_analyzer = {
      name = "rust-analyzer";
    };
    conform-nvim.settings.formatters_by_ft.rust = [ "rustfmt" ];
    crates-nvim = {
      enable = true;
      extraOptions = {
        lsp = {
          enabled = true;
          actions = true;
          completion = true;
          hover = true;
        };
        completion = {
          cmp.enabled = true;
          crates.enabled = true;
        };
      };
    };
  };
  # autoCmd = [
  #   {
  #     event = [ "FileType" ];
  #     pattern = [ "rust" ];
  #     callback.__raw = ''
  #       function(arg)
  #         vim.keymap.set( "n", "<leader>a", function()
  #           vim.cmd.RustLsp('codeAction')
  #         end, { silent = true, buffer = arg.buf } )
  #       end
  #     '';
  #   }
  # ];
}
