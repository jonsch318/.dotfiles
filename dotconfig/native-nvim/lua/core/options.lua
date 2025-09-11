vim.g.mapleader = vim.keycode("<space>")
vim.g.maplocalleader = vim.keycode("<CR>")

vim.opt.fileencoding = "utf-8"
vim.opt.winborder = "rounded"

vim.opt.tabstop = 2 -- tab width
vim.opt.shiftwidth = 0 -- follow tabstop value
vim.opt.expandtab = true -- convert tab to spaces
vim.opt.autoindent = true -- automatically indent lines
vim.opt.smartindent = true -- auto-indenting when starting a new file
vim.opt.shiftround = true -- round indent to multiples of shiftwidth

vim.opt.mouse = "a"

vim.opt.wrap = false
vim.opt.cursorcolumn = false
vim.opt.ignorecase = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true

vim.opt.undofile = true -- enable persistent undos
vim.opt.undolevels = 10000

vim.opt.signcolumn = "yes" -- always show sign column

vim.opt.completeopt = {"menuone", "noselect", "popup", "fuzzy", "preview"}

vim.opt.pumheight = 10 -- max height of compl. menu

vim.g.netrw_banner = 0

vim.opt.list = true -- use special chars for tabs & trailing chars
vim.opt.listchars = {
    tab = "▏ ",
    trail = "·",
    extends = "»",
    precedes = "«",
}

vim.opt.confirm = true -- show dialog for unsafed files before quit
vim.opt.updatetime = 200 -- debounce swap file

-- Searching
vim.opt.ignorecase = true -- case insensitive search
vim.opt.smartcase = true -- case insensitive until first upper case

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
