return {
	-- {
	-- 	"blink.compat",
	-- 	for_cat = "general",
	-- },
	{
		"blink.cmp",
		for_cat = "general",
		event = "DeferredUIEnter",
		after = function()
			require("blink.cmp").setup({
				sources = {
					-- TODO lazydev completion
					default = { "lsp", "path", "snippets", "buffer" },
					per_filetype = { lua = { "lazydev", "lsp", "path", "snippets", "buffer" } },
					providers = {
						lazydev = {
							name = "LazyDev",
							module = "lazydev.integrations.blink",
							score_offset = 100,
						},
					},
				},
				signature = { enabled = true },
				keymap = { preset = "super-tab" },
				completion = {
					keyword = { range = "full" },
					menu = {
						draw = {
							treesitter = { "lsp" },
						},
					},
					documentation = {
						auto_show = true,
						auto_show_delay_ms = 200,
					},
				},
			})
		end,
	},
}
