return {
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            on_attach = function(bufnr)
                local gitsigns = require("gitsigns")
                local opts = { buffer = bufnr }

                vim.keymap.set("n", "]c", gitsigns.next_hunk, opts)
                vim.keymap.set("n", "[c", gitsigns.prev_hunk, opts)
                vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk, opts)
                vim.keymap.set("n", "<leader>hs", gitsigns.stage_hunk, opts)
                vim.keymap.set("n", "<leader>hu", gitsigns.undo_stage_hunk, opts)
            end,
        },
    },
}
