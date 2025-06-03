return {
	{
		"ibhagwan/fzf-lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {},
		cmd = "FzfLua",
		keys = {
			{
				"<leader>fg",
				function()
					require("fzf-lua").live_grep()
				end,
				desc = "Live-Grep (fzf-lua)",
			},
			{
				"<leader>fG",
				function()
					require("fzf-lua").grep()
				end,
				desc = "Grep (fzf-lua)",
			},
			{
				"<leader>fw",
				function()
					require("fzf-lua").grep_cword()
				end,
				desc = "Word-Grep (fzf-lua)",
			},
			{
				"<leader>fW",
				function()
					require("fzf-lua").grep_cWORD()
				end,
				desc = "WORD-Grep (fzf-lua)",
			},

			{
				"<leader>fb",
				function()
					require("fzf-lua").buffers()
				end,
				desc = "Buffers (fzf-lua)",
			},
			{
				"<leader>fs",
				function()
					require("fzf-lua").files()
				end,
				desc = "Files (fzf-lua)",
			},
			{
				"<leader><space>",
				function()
					require("fzf-lua").files()
				end,
				desc = "Files",
			},
			-- vim.keymap.set("n", "<leader><space>", function()
			-- 	require("telescope").extensions.smart_open.smart_open()
			-- end, { silent = true, desc = "Find Files (Smart Open Telescope)" })({
			-- 	"<leader>fo",
			-- 	function()
			-- 		require("fzf-lua").files()
			-- 	end,
			-- 	desc = "Oldfiles (fzf-lua)",
			-- }),

			{
				"<leader>fr",
				function()
					require("fzf-lua").resume()
				end,
				desc = "Resume fzf-lua",
			},
			{
				"<leader>fm",
				function()
					require("fzf-lua").keymaps()
				end,
				desc = "keymaps (fzf-lua)",
			},
			{
				"<C-/>",
				function()
					require("fzf-lua").keymaps()
				end,
				desc = "keymaps (fzf-lua)",
			},
		},
	},
}
