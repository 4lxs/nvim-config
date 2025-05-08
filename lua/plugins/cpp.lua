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
				nixCats("clangd_path"),
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
		for_cat = "cpp",
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
	{
		"competitest.nvim",
		for_cat = "cpp",
		-- ft = { "cpp", "c" },
		cmd = "CompetiTest",
		keys = {
			{ "<leader>ct", "+CompetiTest" },
			{ "<leader>ctr", "<cmd>CompetiTest receive problem<cr>", desc = "CompetiTest receive problem" },
			{ "<leader>ctt", "<cmd>CompetiTest run<cr>", "CompetiTest run" },
			{ "<leader>cta", "<cmd>CompetiTest add_testcase<cr>", "CompetiTest Add testcase" },
			{ "<leader>cte", "<cmd>CompetiTest edit_testcase<cr>", "CompetiTest Edit testcase" },
			{ "<leader>ctd", "<cmd>CompetiTest delete_testcase<cr>", "CompetiTest Delete testcase" },
		},
		after = function()
			require("competitest").setup({
				received_problems_path = "$(HOME)/Projects/cp/problems/$(CONTEST) - $(PROBLEM).$(FEXT)",
				template_file = "$(HOME)/Projects/cp/templates/template.$(FEXT)",
				evaluate_template_modifiers = true,
				compile_command = {
					cpp = {
						exec = "clang++",
						args = {
							"-DLOCAL",
							"$(FNAME)",
							"-o",
							"$(FNOEXT)",
							"-Wall",
							"-Wextra",
							"-pedantic",
							"-std=c++17",
							"-O2",
							"-Wshadow",
							"-Wformat=2",
							"-Wfloat-equal",
							"-Wshift-overflow",
							"-Wcast-qual",
							"-Wcast-align",
							"-D_GLIBCXX_DEBUG",
							"-D_GLIBCXX_DEBUG_PEDANTIC",
							"-fsanitize=address",
							"-fsanitize=undefined",
							"-fno-sanitize-recover",
							"-fstack-protector",
						},
					},
				},
			})
		end,
	},
}
