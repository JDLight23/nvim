return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
            local mr = require("mason-registry")
            mr.refresh(function()
                for _, pkg_name in ipairs({ "clangd", "pyright", "robotframework-lsp" }) do
                    local ok, pkg = pcall(mr.get_package, pkg_name)
                    if ok and not pkg:is_installed() then
                        pkg:install()
                    end
                end
            end)
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "saghen/blink.cmp",
        },
        config = function()
            vim.lsp.config("*", {
                capabilities = require("blink.cmp").get_lsp_capabilities(),
            })

            vim.lsp.enable({ "clangd", "pyright", "robotframework_ls" })

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(ev)
                    local opts = { buffer = ev.buf }
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
                    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
                    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
                end,
            })
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "qf",
                callback = function(ev)
                    local opts = { buffer = ev.buf, silent = true }
                    -- jump to entry, then close the list
                    vim.keymap.set("n", "<CR>", "<CR><cmd>cclose<CR>", opts)
                    -- peek: jump to entry but keep focus in the quickfix window
                    vim.keymap.set("n", "p", function()
                        local qf_win = vim.api.nvim_get_current_win()
                        vim.cmd("normal! \r")
                        vim.api.nvim_set_current_win(qf_win)
                    end, opts)
                end,
            })
        end,
    },
}
