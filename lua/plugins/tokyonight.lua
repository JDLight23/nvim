return {
    {
        "folke/tokyonight.nvim",
        lazy = false, -- load immediately
        priority = 1000, -- load before other plugins
        config = function()
            require("tokyonight").setup({
                style = "night",
                styles = {
                    comments = { italic = true },
                    keywords = { italic = false },
                },
            })

            vim.cmd.colorscheme("tokyonight")
            -- trying to get colorscheme to fit entire screen
            -- vim.cmd([[hi Normal guibg=#1a1b26]])
            -- vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])
        end,
    },
}
