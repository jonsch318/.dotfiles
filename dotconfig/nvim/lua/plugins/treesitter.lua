return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			-- "nvim-treesitter/nvim-treesitter-textobjects",
		},
		lazy = false,
		cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
		branch = "main",
		build = ":TSUpdate",
		opts = {},
	},
}
