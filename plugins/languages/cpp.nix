{ pkgs, ... }:
{
  plugins = {
    # lint.lintersByFt.cpp = [ "cppcheck" "cpplint" ];
    conform-nvim.formattersByFt.cpp = [ "clang-format" ];
    lsp.servers.clangd = {
      enable = true;
      cmd = [
        "clangd"
        # "--header-insertion=never"
        "--header-insertion=iwyu"
        "--background-index"
        "--clang-tidy"
        "--all-scopes-completion"
        "--completion-style=detailed"
        "--function-arg-placeholders"
        "--fallback-style=llvm"
        "-j=6"
      ];
      onAttach.function = ''
        vim.keymap.set('n', 'go', "<cmd>ClangdSwitchSourceHeader<cr>", { desc = "Switch Source/Header (C/C++)", buffer = bufnr })

        require("clangd_extensions.inlay_hints").setup_autocmd()
        require("clangd_extensions.inlay_hints").set_inlay_hints()
      '';
      extraOptions = {
        init_options = {
          usePlaceholders = true;
          completeUnimported = true;
          clangdFileStatus = true;
        };
      };
    };
    clangd-extensions = {
      enable = true;
      extraOptions = {
        inlay_hints = {
          inline = false;
          # show_parameter_hints = false;
        };
        codelens.enable = true;
      };
      ast = {
        roleIcons = {
          type = "";
          declaration = "";
          expression = "";
          specifier = "";
          statement = "";
          templateArgument = "";
        };
        kindIcons = {
          compound = "";
          recovery = "";
          translationUnit = "";
          packExpansion = "";
          templateTypeParm = "";
          templateTemplateParm = "";
          templateParamObject = "";
        };
      };
    };
  };

  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      pname = "cmake-tools.nvim";
      version = "2024-03-19";
      src = pkgs.fetchFromGitHub {
        owner = "Civitasv";
        repo = "cmake-tools.nvim";
        rev = "a4cd0b3a2c8a166a54b36bc00579954426748959";
        sha256 = "6A78j0CGDpoRcFWAlzviUB92kAemt9Dlzic1DvZNJ64=";
      };
    })
  ];

  extraConfigLua = ''
    require('cmake-tools').setup {
      cmake_build_directory = 'build',
      cmake_kits_path = vim.fn.expand("~/Projects/eba/cmake-kits.json")
    }
  '';
}
