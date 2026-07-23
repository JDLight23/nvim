#!/usr/bin/env bash
set -e

# Neovim 0.12+
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
sudo ln -sf /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim
rm nvim-linux-x86_64.tar.gz

# Verify neovim is 0.12+
NVIM_VERSION=$(nvim --version | head -n1 | grep -oE '[0-9]+\.[0-9]+' | head -n1)
REQUIRED="0.12"
if [ "$(printf '%s\n' "$REQUIRED" "$NVIM_VERSION" | sort -V | head -n1)" != "$REQUIRED" ]; then
  echo "Neovim version $NVIM_VERSION found, but 0.12+ is required."
  echo "This may mean an old nvim binary is still cached on PATH — open a fresh terminal and re-check with 'nvim --version'."
  exit 1
fi

# Node/npm + ripgrep
sudo apt install -y nodejs npm ripgrep

# tree-sitter CLI
curl -L https://github.com/tree-sitter/tree-sitter/releases/download/v0.26.9/tree-sitter-linux-x64.gz | gunzip > tree-sitter
chmod +x tree-sitter
sudo mv tree-sitter /usr/local/bin/

echo "Done. Open a fresh terminal, then run nvim and let Mason install LSPs (:Mason to check status)."
