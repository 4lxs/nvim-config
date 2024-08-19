{
  plugins = {
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
}
