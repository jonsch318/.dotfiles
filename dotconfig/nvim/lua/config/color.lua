-- require("onedark").load()

-- vim.cmd("colorscheme posterpole-term")
-- vim.cmd("colorscheme catppuccin-mocha")
vim.cmd("colorscheme vague")
vim.api.nvim_set_hl(0, "Normal", { fg = vim.api.nvim_get_hl(0, { name = "Normal" }).fg, bg = "black" })
