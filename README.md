# Neovim Config
My current neovim config. Back up or remove `~/.config/nvim` if it exists first,
then use the following command to clone:

```
mkdir -p ~/.config && cd ~/.config
git clone https://github.com/JDLight23/nvim.git
```

## Plugins
Currently includes:
- LSP servers managed by [Mason](https://github.com/williamboman/mason.nvim)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- A couple QOL plugins ([nvim-autopairs](https://github.com/windwp/nvim-autopairs), [vim-python-pep8-indent](https://github.com/Vimjas/vim-python-pep8-indent))
- [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) for colorscheme

## Setup
On Mac, run:

```
./scripts/setup-mac.sh
```
On Ubuntu Linux distributions, run:
```
./scripts/setup-linux.sh
```

#### Troubleshooting
If an LSP isn't working after setup, open `:Mason` and check that all servers
show as installed. If `pyright` failed, it likely means npm wasn't
available yet when Mason first tried — run `:MasonInstall pyright` to retry.

If setup script doesn't like Neovim version even after updating to 0.12+, try
opening a fresh terminal, your shell could be caching the binary path to the
old version


See [cheatsheet.txt](./cheatsheet.md) for a list of plugin shortcuts.
