return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
		build = ":TSUpdate",
		opts = {
			highlight = {
				enable = true,
			},
			{
				context_commentstring = {
					enable = true,
					enable_autocmd = false,
				},
			},
			textobjects = {
				move = {
					enable = true,
					goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
					goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer" },
					goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
					goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer" },
				},
			},
			endwise = {
				enable = true,
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
			require("config.filetypes").treesitter_setup()
		end,
	},
}
