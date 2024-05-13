{ svlib, ... }:
{
  plugins.trouble = {
    enable = true;
    settings = {
      auto_close = true;
      use_diagnostic_signs = true;
    };
  };
  keymaps = svlib.createKeymaps "n" {
    "<leader>x" = "+diagnostics/quickfix";
    "<leader>xx" = {
      action = "<cmd>TroubleToggle<cr>";
      desc = "Document Diagnostics (Trouble)";
    };
    "<leader>xX" = {
      action = "<cmd>TroubleToggle workspace_diagnostics<cr>";
      desc = "Workspace Diagnostics (Trouble)";
    };
    "<leader>xt" = {
      action = "<cmd>TroubleToggle todo<cr>";
      desc = "Todo (Trouble)";
    };

    "<leader>xq" = "<cmd>Trouble quickfix toggle<cr>";
    "<leader>xl" = "<cmd>Trouble loclist toggle<cr>";

    "]q" = {
      action.__raw = ''
        function()
          require('trouble').next({ skip_groups = true, jump = true })
        end
      '';
    };
    "[q" = {
      action.__raw = ''
        function()
          require('trouble').previous({ skip_groups = true, jump = true })
        end
      '';
    };
  };
}
