{
  pkgs,
  lib,
  svlib,
  ...
}:
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
    lsp.enabledServers = [
      {
        name = "emmet_language_server";
        extraOptions = {
          cmd = [
            (lib.getExe pkgs.emmet-language-server)
            "--stdio"
          ];
          filetypes = [
            "javascript"
            "javascriptreact"
            "typescript"
            "typescriptreact"
            "svelte"
          ];
        };
      }
    ];
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
        cmd = [
          (lib.getExe pkgs.eslint_d)
          "--stdio"
        ];
        filetypes = [
          "javascript"
          "javascriptreact"
          "typescript"
          "typescriptreact"
          "svelte"
        ];

      };
      tailwindcss = {
        enable = true;
        cmd = [
          (lib.getExe pkgs.tailwindcss-language-server)
          "--stdio"
        ];
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
    ts-autotag = {
      enable = true;
    };
  };

  extraPlugins = with pkgs.vimUtils; [
    (buildVimPlugin rec {
      pname = "tailwind-tools.nvim";
      version = "2024-07-15";
      src = pkgs.fetchFromGitHub {
        owner = "luckasRanarison";
        repo = pname;
        rev = "ce3ab3fd6ad05d08fbfc1ef84b3f5312cd05ee6d";
        sha256 = "fOzypdU21/wfzImW9f3B9B8IM68OvW+WHeVABJgzuXw=";
      };
    })
  ];
  extraConfigLua = ''
    require("tailwind-tools").setup({
    })
  '';
  keymaps =
    svlib.createKeymaps "n" {
      "<leader>cc" = {
        action = "<cmd>TailwindConcealToggle<cr>";
        desc = "Toggle TailwindCSS classes";
      };
      "<leader>cs" = {
        action = "<cmd>TailwindSort<cr>";
        desc = "Sort TailwindCSS classes";
      };
    }
    ++ svlib.createKeymaps "x" {
      "<leader>cs" = {
        action = "<cmd>TailwindSortSelection<cr>";
        desc = "Sort TailwindCSS classes";
      };
    };
}
