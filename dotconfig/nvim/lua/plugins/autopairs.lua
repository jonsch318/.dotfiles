return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	{
		"windwp/nvim-ts-autotag",
		lazy = false,
		opts = {
			aliases = {
				["svx"] = "svelte",
			},
		},
	},
}
