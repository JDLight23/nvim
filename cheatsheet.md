# Plugin Shortcuts
> Note: \<leader> is Space Bar

### LSP
- `gd` - go to definition
- `gi` - go to implementation
- `gr` - find references, list every place in project symbol used
    - Note: can hit `p` (as in peek) when hovering over reference in popup
    to go to line in file without exiting popup
- `<leader>rn` - rename every reference to selected symbol
- `<leader>ca` - "code action," offers fix for error
- `K` - hover docs, shows docstring/type signature
- `]d` / `[d` - jump to next/previous diagnostic
- `<leader>e` - press when hovering over diagnostic to view message

### Telescope
- `<leader>ff` - find file in project
- `<leader>fg` - find contents in other files within project
- `<leader>fb` - list buffers
- `<leader>fh` - search help docs

### Gitsigns
- `]c` / `[c` - jump to next/previous "hunk" (contiguous block of changed lines)
- `<leader>hp` - preview hunk (small git diff)
- `<leader>hs` - stage JUST that hunk
- `<leader>hu` - undo stage hunk

### Other
- `<leader>o` - jump back through jumplist (e.g. after `gd`)
- `<leader>i` - jump forward through jumplist
- `<leader>t` - Pop back up tag stack (e.g. after several `gd`'s)
