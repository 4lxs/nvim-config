return {
	{
		"lua_ls",
		for_cat = "lua",
		lsp = {
			filetypes = { "lua" },
			cmd = {
				nixCats("lua_ls_path"),
			},
			settings = {
				Lua = {
					runtime = { version = "LuaJIT" },
					formatters = {
						ignoreComments = true,
					},
					signatureHelp = { enabled = true },
					diagnostics = {
						globals = { "nixCats", "vim" },
						disable = { "missing-fields" },
					},
					telemetry = { enabled = false },
					-- 	diagnostics = {
					-- 		underline = true,
					-- 		update_in_insert = false,
					-- 		virtual_text = {
					-- 			spacing = 4,
					-- 			source = "if_many",
					-- 			-- prefix = "●",
					-- 			prefix = "icons",
					-- 		},
					-- 		severity_sort = true,
					-- 	},
					-- 	inlay_hints = {
					-- 		enabled = true,
					-- 		exclude = { "vue" }, -- filetypes for which you don't want to enable inlay hints
					-- 	},
					-- 	codelens = {
					-- 		enabled = false,
					-- 	},
					-- 	capabilities = {
					-- 		workspace = {
					-- 			fileOperations = {
					-- 				didRename = true,
					-- 				willRename = true,
					-- 			},
					-- 		},
					-- 	},
					-- 	format = {
					-- 		formatting_options = nil,
					-- 		timeout_ms = nil,
					-- 	},
				},
			},
		},
	},
}
