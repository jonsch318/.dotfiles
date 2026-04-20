return {
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
		init = function()
			vim.g.no_plugin_maps = true
		end,
		opts = {
			lookahead = true,
			selection_modes = {
				["@parameter.outer"] = "v", -- charwise
				["@function.outer"] = "v", -- linewise
				["@class.outer"] = "V", -- blockwise
			},
		},
	},
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
