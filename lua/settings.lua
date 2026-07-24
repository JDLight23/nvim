-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Tabs and indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = false

-- Other
vim.opt.mouse = ""
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"

-- Persist undo history across sessions
vim.opt.undofile = true

-- Minimal statusline: filename + diagnostic error/warning counts
_G.statusline_diagnostics = function()
    local counts = { ERROR = 0, WARN = 0 }
    for _, d in ipairs(vim.diagnostic.get(0)) do
        if d.severity == vim.diagnostic.severity.ERROR then
            counts.ERROR = counts.ERROR + 1
        elseif d.severity == vim.diagnostic.severity.WARN then
            counts.WARN = counts.WARN + 1
        end
    end
    local parts = {}
    if counts.ERROR > 0 then
        table.insert(parts, "E:" .. counts.ERROR)
    end
    if counts.WARN > 0 then
        table.insert(parts, "W:" .. counts.WARN)
    end
    return table.concat(parts, " ")
end

vim.opt.statusline = "%f %m%=%{%v:lua.statusline_diagnostics()%} "

-- Redraw statusline as soon as diagnostics change, not just on cursor move
vim.api.nvim_create_autocmd("DiagnosticChanged", {
    callback = function()
        vim.cmd("redrawstatus")
    end,
})

-- Border on all floating windows (hover, signature help, diagnostics, etc.)
vim.o.winborder = "single"

-- Auto-reload files changed outside of neovim
vim.opt.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, { command = "checktime" })
