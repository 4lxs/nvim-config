return {
	{
		"clangd",
		for_cat = "cpp",
		lsp = {
			filetypes = { "cpp", "c" },
			capabilities = {
				offsetEncoding = { "utf-16" },
			},
			cmd = {
				"clangd",
				"--background-index",
				"--clang-tidy",
				"--header-insertion=iwyu",
				"--completion-style=detailed",
				"--function-arg-placeholders",
				"--fallback-style=llvm",
			},
			init_options = {
				usePlaceholders = true,
				completeUnimported = true,
				clangdFileStatus = true,
			},
		},
	},
	{
		"clangd_extensions.nvim",
		after = function()
			require("clangd_extensions").setup({
				opts = {
					inlay_hints = {
						inline = false,
					},
				},
			})
		end,
	},
}
