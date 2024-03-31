{
  imports = [
    ############
    #### select colorscheme
    ############
    ./colorschemes/catppuccin.nix
    # ./colorschemes/tokyonight.nix

    ./completion/cmp.nix
    ./completion/luasnip.nix
    ./completion/copilot.nix
    ./completion/lspkind.nix

    ./git/gitsigns.nix
    ./git/fugitive.nix

    ./treesitter/treesitter.nix
    ./treesitter/treesitter-context.nix
    ./treesitter/treesitter-textobjects.nix
    ./treesitter/ts-context-commentstring.nix

    ./cp/competitest.nix

    ./languages/nvim-lint.nix
    ./languages/rust.nix
    ./languages/markdown
    ./languages/nix.nix
    ./languages/cpp.nix
    ./languages/log.nix
    ./dap/dap.nix

    ./lsp/conform.nix
    ./lsp/fidget.nix
    ./lsp/lsp.nix
    ./lsp/lspsaga.nix
    ./lsp/trouble.nix

    ./telescope/telescope.nix

    ./ui/dressing-nvim.nix
    ./ui/indent-blankline.nix
    ./ui/noice.nix
    ./ui/nvim-notify.nix
    ./ui/nui.nix
    ./ui/oil.nix
    ./ui/lualine.nix
    ./ui/alpha.nix

    ./utils/flash.nix
    ./utils/hardtime.nix
    ./utils/harpoon.nix
    ./utils/mini.nix
    ./utils/neodev.nix
    ./utils/neotest.nix
    ./utils/nvim-colorizer.nix
    ./utils/nvim-surround.nix
    ./utils/persistence.nix
    ./utils/plenary.nix
    ./utils/todo-comments.nix
    ./utils/ultimate-autopair.nix
    ./utils/undotree.nix
    ./utils/whichkey.nix
    ./utils/tmux-navigator.nix
    ./utils/sleuth.nix
  ];
}
