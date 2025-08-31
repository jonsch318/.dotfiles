vim.g.mapleader = " "
vim.opt.fileencoding = "utf-8"
vim.opt.winborder = "rounded"

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.mouse = "a"

vim.opt.wrap = false
vim.opt.cursorcolumn = false
vim.opt.ignorecase = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.signcolumn = "yes"
vim.opt.completeopt = {"menuone", "noselect", "popup"}

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

-- PLUGINS
vim.pack.add({
  { src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/vague2k/vague.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects", version = "main" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	{ src = "https://github.com/steelsojka/pears.nvim" },
	{ src = "https://github.com/windwp/nvim-ts-autotag" },
	{ src = "https://github.com/ibhagwan/fzf-lua" },
	{ src = "https://github.com/kylechui/nvim-surround" },
})

require("mason").setup()
require("oil").setup()
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

--- TREESITTER
require("nvim-treesitter").install({"rust", "java", "lua", "javascript", "typescript", "yaml", "json"})
local already_installed = require("nvim-treesitter.config").get_installed('parsers')

local function ts_start(bufnr, parser_name)
	vim.treesitter.start(bufnr, parser_name)
	-- Use regex based syntax-highlighting as fallback as some plugins might need it
	vim.bo[bufnr].syntax = "ON"
	-- Use treesitter for folds
	vim.wo.foldlevel = 99
	vim.wo.foldmethod = "expr"
	vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
	vim.wo.foldtext = "v:lua.vim.treesitter.foldtext()"
	-- Use treesitter for indentation
	vim.bo[bufnr].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
end


-- Auto-install and start parsers for any buffer
vim.api.nvim_create_autocmd({ "FileType" }, {
	desc = "Enable Treesitter",
	callback = function(event)
		local bufnr = event.buf
		local filetype = event.match

		-- Skip if no filetype
		if filetype == "" then
			return
		end

		local parser_name = vim.treesitter.language.get_lang(filetype)
		if not parser_name then
			vim.notify(vim.inspect("No treesitter parser found for filetype: " .. filetype),
				vim.log.levels.WARN)
			return
		end

		-- Try to get existing parser
		if not vim.tbl_contains(require("nvim-treesitter.config").get_available(), parser_name) then return end

		-- Check if parser is already installed
		if not vim.tbl_contains(already_installed, parser_name) then
			-- If not installed, install parser asynchronously and start treesitter
			vim.notify("Installing parser for " .. parser_name, vim.log.levels.INFO)
			require("nvim-treesitter").install({ parser_name }):await(
				function()
					ts_start(bufnr, parser_name)
				end
			)
			return
		end

		-- Start treesitter for this buffer
		ts_start(bufnr, parser_name)
	end,
})

-- LSP

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = {
					"require",
				},
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
})
vim.lsp.enable("lua_ls")

vim.lsp.enable("stylua")

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client ~= nil and client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})

-- MAP
local map = vim.keymap.set
map('n', "-", ":Oil<CR>")
-- map("i", "<C-e>", function()
-- 	require("luasnip").expand_or_jump(1)
-- end, { silent = true })

-- fzf-lua keymaps
map('n', "<leader>fg", function()
	require("fzf-lua").live_grep()
end, { desc = "Live-Grep (fzf-lua)" })

map('n', "<leader>fG", function()
	require("fzf-lua").grep()
end, { desc = "Grep (fzf-lua)" })

map('n', "<leader>fw", function()
	require("fzf-lua").grep_cword()
end, { desc = "Word-Grep (fzf-lua)" })

map('n', "<leader>fW", function()
	require("fzf-lua").grep_cWORD()
end, { desc = "WORD-Grep (fzf-lua)" })

map('n', "<leader>fb", function()
	require("fzf-lua").buffers()
end, { desc = "Buffers (fzf-lua)" })

map('n', "<leader>fs", function()
	require("fzf-lua").files()
end, { desc = "Files (fzf-lua)" })

map('n', "<leader><space>", function()
	require("fzf-lua").files()
end, { desc = "Files" })

map('n', "<leader>fr", function()
	require("fzf-lua").resume()
end, { desc = "Resume fzf-lua" })

map('n', "<leader>fm", function()
	require("fzf-lua").keymaps()
end, { desc = "keymaps (fzf-lua)" })

map('n', "<C-/>", function()
	require("fzf-lua").keymaps()
end, { desc = "keymaps (fzf-lua)" })

-- LSP MAP
vim.keymap.del("n", "gra")
map("n", "gra", function()
	require("fzf-lua").lsp_code_actions()
end, { desc = "Code Actions" })
map("n", "<F2>", vim.lsp.buf.rename, { silent = true, desc = "Rename" })

-- GOTO
map("n", "grd", function()
	require("fzf-lua").lsp_definitions()
end, { desc = "Goto Definitions" })

map("n", "grD", function()
	require("fzf-lua").lsp_declarations()
end, { desc = "Goto Definitions" })

vim.keymap.del("n", "grr")
map("n", "grr", function()
	require("fzf-lua").lsp_references()
end, { desc = "Goto References" })

vim.keymap.del("n", "gri")
map("n", "gri", function()
	require("fzf-lua").lsp_implementations()
end, { desc = "Goto References" })

map("n", "grf", function()
	require("fzf-lua").lsp_finder()
end, { desc = "Finder" })

map("n", "grF", function()
	vim.lsp.buf.format()
end, { desc = "Finder" })

map("n", "grt", function()
	require("fzf-lua").lsp_typedefs()
end, { desc = "Typedefs" })

map("n", "grc", function()
	require("fzf-lua").lsp_incoming_calls()
end, { desc = "Goto Incoming Calls" })
map("n", "grC", function()
	require("fzf-lua").lsp_outgoing_calls()
end, { desc = "Goto Outgoing Calls" })

map("n", "grs", function()
	require("fzf-lua").lsp_document_symbols()
end, { desc = "Document Symbols" })

-- Hover

map("i", "<C-K>", vim.lsp.buf.signature_help, { silent = true, desc = "Hover Signature Help" })

require("fzf-lua").register_ui_select()

-- COLORS
require("vague").setup({ transparent = true })
vim.cmd("colorscheme vague")
vim.cmd(":hi statusline guibg=NONE")

-- SNIPPETS
local ls = require("luasnip")
ls.setup({ enable_autosnippets = true })
require("luasnip.loaders.from_lua").load({ paths = "$MYVIMRC/snippets" })
