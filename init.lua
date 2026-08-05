-- Must be set before requiring settings/lazy, since leader-key mappings
-- in those files are resolved at registration time.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("settings")
require("config.lazy")

-- Can exit insert and visual mode by pressing "jk"
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })
