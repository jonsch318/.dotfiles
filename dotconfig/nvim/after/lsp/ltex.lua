return {
	on_attach = function()
		require("ltex_extra").setup({
			path = vim.fn.expand("~") .. "/.local/share/ltex",
		})
	end,
}
