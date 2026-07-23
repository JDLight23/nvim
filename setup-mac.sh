#!/usr/bin/env bash
set -e

brew install neovim node ripgrep tree-sitter tree-sitter-cli

# Verify neovim is 0.12+
NVIM_VERSION=$(nvim --version | head -n1 | grep -oE '[0-9]+\.[0-9]+' | head -n1)
REQUIRED="0.12"
if [ "$(printf '%s\n' "$REQUIRED" "$NVIM_VERSION" | sort -V | head -n1)" != "$REQUIRED" ]; then
  echo "Neovim version $NVIM_VERSION found, but 0.12+ is required. Run: brew upgrade neovim"
  exit 1
fi

echo "Done. Open a fresh terminal, then run nvim and let Mason install LSPs (:Mason to check status)."
