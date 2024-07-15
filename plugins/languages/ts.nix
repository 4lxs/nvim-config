{
  plugins = {
    # lint = {
    #   linters.eslint_d.cmd = "${pkgs.eslint_d}/bin/eslint_d";
    #   lintersByFt = {
    #     ts = [ "eslint_d" ];
    #     js = [ "eslint_d" ];
    #     svelte = [ "eslint_d" ];
    #   };
    # };
    lsp.servers = {
      svelte = {
        enable = true;
      };
      tsserver = {
        enable = true;
        filetypes = [
          "javascript"
          "javascriptreact"
          "typescript"
          "typescriptreact"
          "svelte"
        ];
        settings = {
          complete_function_calls = true;
          vtsls = {
            enableMoveToFileCodeAction = true;
            autoUseWorkspaceTsdk = true;
            experimental = {
              completion = {
                enableServerSideFuzzyMatch = true;
              };
            };
          };
          typescript = {
            updateImportsOnFileMove.enabled = "always";
            suggest = {
              completeFunctionCalls = true;
            };
            inlayHints = {
              enumMemberValues.enabled = true;
              functionLikeReturnTypes.enabled = true;
              parameterNames.enabled = "literals";
              parameterTypes.enabled = true;
              propertyDeclarationTypes.enabled = true;
              variableType.enabled = false;
            };
          };
        };
      };
      eslint = {
        enable = true;
      };
    };
    conform-nvim.formattersByFt = {
      html = [
        [
          "prettierd"
          "prettier"
        ]
      ];
      css = [
        [
          "prettierd"
          "prettier"
        ]
      ];
      javascript = [
        [
          "prettierd"
          "prettier"
        ]
      ];
      javascriptreact = [
        [
          "prettierd"
          "prettier"
        ]
      ];
      typescript = [
        [
          "prettierd"
          "prettier"
        ]
      ];
      typescriptreact = [
        [
          "prettierd"
          "prettier"
        ]
      ];
      svelte = [
        [
          "prettierd"
          "prettier"
        ]
      ];
    };
  };
}
