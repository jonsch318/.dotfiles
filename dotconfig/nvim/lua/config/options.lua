-- map(local) leader
vim.g.mapleader = " " -- set `mapleader` before lazy for correct mappigng
vim.g.maplocalleader = "\\" -- "\\"

-- encoding
vim.opt.fileencoding = "utf-8"

-- linenumbers
vim.opt.nu = true -- enable line numbers
vim.opt.relativenumber = true -- hate them? love them
vim.opt.signcolumn = "yes"

-- tabs & spaces
vim.opt.tabstop = 2 -- TODO: maybe 2?
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- gui features
vim.opt.mouse = "a"

-- 24-bit colors
vim.opt.termguicolors = true

-- clipboard
vim.opt.clipboard = "unnamedplus"

-- editor
vim.opt.showtabline = 0

-- diagnostic
local signs = { Error = "", Warn = "", Info = "", Hint = "" }
vim.diagnostic.config({
	virtual_text = {
		severity = {
			min = vim.diagnostic.severity.INFO,
		},
	},
	virtual_lines = {
		current_line = true,
		severity = {
			min = vim.diagnostic.severity.INFO,
		},
	},
	signs = {
		active = signs,
	},
	update_in_insert = true,
	severity_sort = true,
	float = {
		focusable = true,
		style = "minimal",
		border = "rounded",
		source = "if_many",
		header = "",
		prefix = "",
	},
})
