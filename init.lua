require("settings")
require("config.lazy")

-- Can exit insert and visual mode by pressing "jk"
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })
