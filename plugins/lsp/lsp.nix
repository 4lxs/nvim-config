{ svlib, ... }:
{
  plugins = {
    lsp-format = {
      enable = false; # Enable it if you want lsp-format integration for none-ls
    };
    lsp = {
      enable = true;
      capabilities = "offsetEncoding =  'utf-16'";
      servers = {
        slint-lsp = {
          enable = true;
          filetypes = [
            "slint"
          ];
        };
        lua-ls = {
          enable = true;
          extraOptions = {
            settings = {
              Lua = {
                completion = {
                  callSnippet = "Replace";
                };
                telemetry = {
                  enabled = false;
                };
                hint = {
                  enable = true;
                };
              };
            };
          };
        };
        pyright = {
          enable = true;
        };
        ruff-lsp = {
          enable = true;
        };
      };
      keymaps = {
        silent = true;
        lspBuf = {
          gd = {
            action = "definition";
            desc = "Goto Definition";
          };
          K = {
            action = "hover";
            desc = "Hover";
          };
          "<leader>cr" = {
            action = "rename";
            desc = "Rename";
          };
          "<leader>ca" = {
            action = "code_action";
            desc = "Code Action";
          };
          # "<leader>cc" = {
          #   action = "code_lens.run";
          #   desc = "Code Lens";
          # };
          # "<leader>cC" = {
          #   action = "code_lens.refresh";
          #   desc = "Refresh Code Lens";
          # };
        };
        extra = svlib.createKeymaps "i" {
          "<c-k>" = {
            action.__raw = "vim.lsp.buf.signature_help";
            desc = "Signature Help";
          };
        };
        diagnostic = {
          "<leader>cd" = {
            action = "open_float";
            desc = "Line Diagnostics";
          };
          "]d" = {
            action = "goto_next";
            desc = "Next Diagnostic";
          };
          "[d" = {
            action = "goto_prev";
            desc = "Previous Diagnostic";
          };
        };
      };
    };
  };
  extraConfigLua = ''
    local _border = "rounded"

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover, {
        border = _border
      }
    )

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
      vim.lsp.handlers.signature_help, {
        border = _border
      }
    )

    vim.diagnostic.config{
      float={border=_border}
    };

    require('lspconfig.ui.windows').default_options = {
      border = _border
    }


    vim.filetype.add({
      -- Detect and assign filetype based on the extension of the filename
      extension = {
        slint = "slint",
      },
      -- Detect and apply filetypes based on the entire filename
      filename = {
        [".env"] = "dotenv",
        ["env"] = "dotenv",
        ["tsconfig.json"] = "jsonc",
      },
      -- Detect and apply filetypes based on certain patterns of the filenames
      pattern = {
        -- INFO: Match filenames like - ".env.example", ".env.local" and so on
        -- ["%.env%.[%w_.-]+"] = "dotenv",
      },
    })
  '';
}
