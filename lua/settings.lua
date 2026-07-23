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

-- Minimal statusline: filename + git branch (via gitsigns), no mode/diagnostics clutter
vim.opt.statusline = "%f %m%=%{get(b:, 'gitsigns_head', '')}"

-- Border on all floating windows (hover, signature help, diagnostics, etc.)
vim.o.winborder = "single"

-- Auto-reload files changed outside of neovim
vim.opt.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, { command = "checktime" })
