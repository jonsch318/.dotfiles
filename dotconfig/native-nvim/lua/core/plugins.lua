vim.pack.add({
	{ src = "https://github.com/vague2k/vague.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects", version = "main" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	{ src = "https://github.com/steelsojka/pears.nvim" },
	{ src = "https://github.com/windwp/nvim-ts-autotag" },
  { src = "https://github.com/kylechui/nvim-surround" },
	{ src = "https://github.com/ibhagwan/fzf-lua" },
  { src = "https://github.com/rafamadriz/friendly-snippets"}
})

require("vague").setup({ transparent = true })
require("mason").setup()
require("oil").setup()
require("nvim-web-devicons").setup()
require("fzf-lua").setup()
require("nvim-treesitter").setup()
require("nvim-treesitter-textobjects").setup()
require("nvim-ts-autotag").setup()
require("pears").setup()
require("nvim-surround").setup({
	keymaps = {
		visual = "gs"
	}
})
require("luasnip").setup({ enable_autosnippets = true })
