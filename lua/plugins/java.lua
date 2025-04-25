return {
	{
		"nvim-jdtls",
		for_cat = "java",
		ft = "java",
		after = function()
			require("jdtls").start_or_attach({
				cmd = { nixCats("java-jdtls-path") },
				root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
			})
		end,
	},
}
