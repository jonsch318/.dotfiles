return {
    {
        "ibhagwan/fzf-lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {},
        keys = {
            { "<leader>fg", function() require("fzf-lua").live_grep() end,  desc = "Live-Grep (fzf-lua)" },
            { "<leader>fG", function() require("fzf-lua").grep() end,       desc = "Grep (fzf-lua)" },
            { "<leader>fw", function() require("fzf-lua").grep_cword() end, desc = "Word-Grep (fzf-lua)" },
            { "<leader>fW", function() require("fzf-lua").grep_cWORD() end, desc = "WORD-Grep (fzf-lua)" },

            { "<leader>fb", function() require("fzf-lua").buffers() end,    desc = "Buffers (fzf-lua)" },
            { "<leader>fs", function() require("fzf-lua").files() end,      desc = "Files (fzf-lua)" },
            { "<leader>fo", function() require("fzf-lua").files() end,      desc = "Oldfiles (fzf-lua)" },

            { "<leader>fr", function() require("fzf-lua").resume() end,     desc = "Resume fzf-lua" },
            { "<leader>fm", function() require("fzf-lua").keymaps() end,    desc = "keymaps (fzf-lua)" },
        }
    }
}
