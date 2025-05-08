return {
	{
		"nixd",
		for_cat = "nix",
		lsp = {
			cmd = {
				nixCats("nixd_path"),
			},
			filetypes = { "nix" },
		},
	},
}
