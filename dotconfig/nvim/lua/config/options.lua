-- map(local) leader
vim.g.mapleader = " "       -- set `mapleader` before lazy for correct mappigng
vim.g.maplocalleader = "\\" -- "\\"

-- encoding
vim.opt.fileencoding = "utf-8"

-- linenumbers
vim.opt.nu = true              -- enable line numbers
vim.opt.relativenumber = false -- hate them
vim.opt.signcolumn = "yes"

-- tabs & spaces
vim.opt.tabstop = 2 -- TODO: maybe 2?
vim.opt.shiftwidth = 2
vim.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true



-- gui features

vim.opt.mouse = "a"

-- 24-bit colors
vim.opt.termguicolors = true

--speedup loading
vim.g.skip_ts_context_commmentstring_module = true

-- netrw
-- vim.g.loaded_netrwPlugin = 1
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwSettings = 1
-- vim.g.loaded_netrwFileHandlers = 1
-- vim.g.loaded_netrw_gitignore = 1

-- clipboard
vim.opt.clipboard = "unnamedplus"

-- editor
vim.opt.showtabline = 0
