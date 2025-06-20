-- return {}
-- Autocompletion
return {
	{
		"saghen/blink.cmp",
		version = "1.*",
		dependencies = {
			"rafamadriz/friendly-snippets",
			"moyiz/blink-emoji.nvim",
		},

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = {
				preset = "default",
				["<C-e>"] = { "select_and_accept" },
				["<C-q>"] = { "hide", "fallback" },
			},
			sources = {
				default = { "lazydev", "lsp", "path", "snippets", "buffer", "emoji" },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
					emoji = {
						module = "blink-emoji",
						name = "Emoji",
						opts = { insert = true },
					},
				},
			},
			completion = {
				documentation = { auto_show = true },
				ghost_text = {
					enabled = true,
				},
			},
			signature = {
				enabled = true,
			},
			fuzzy = {
				implementation = "prefer_rust_with_warning",
				sorts = {
					"exact",
					function(a, b)
						if (a.client_name == nil or b.client_name == nil) or (a.client_name == b.client_name) then
							return
						end
						return b.client_name == "emmet_ls"
					end,
					-- default sorts
					"score",
					"sort_text",
				},
			},
		},
	},
}
