return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            vim.schedule(function()
                pcall(vim.cmd, "TSInstall c cpp python lua vim vimdoc")
            end)

            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "c", "cpp", "python", "lua", "vim", "vimdoc" },
                callback = function()
                    vim.treesitter.start()
                    vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
                end,
            })
        end,
    },
}
