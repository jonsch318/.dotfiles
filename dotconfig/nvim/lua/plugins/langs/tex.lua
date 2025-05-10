return {
    {
        "HakonHarnes/img-clip.nvim",
        even = "VeryLazy",
        opts = {},
        keys = {
            { "<LEADER>p", "<CMD>PasteImage<CR>", desc = "Paste Image " }
        }
    },
    {
        "lervag/vimtex",
        lazy = false,
        init = function()
            vim.g.vimtex_view_method = "zathura"
            vim.g.vimtex_quickfix_method = "pplatex"
            vim.g.vimtex_quickfix_mode = 1
            -- vim.g.vimtex_quickfix_autoclose_after_keystrokes = 2
        end,
    },
}
