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
      action = "<cmd>Trouble diagnostics toggle<cr>";
      desc = "Document Diagnostics (Trouble)";
    };
    "<leader>xX" = {
      action = "<cmd>Trouble diagnostics toggle filter.buf=0<cr>";
      desc = "Buffer Diagnostics (Trouble)";
    };
    "<leader>xq" = "<cmd>Trouble qflist toggle<cr>";
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
