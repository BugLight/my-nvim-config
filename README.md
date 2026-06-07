# My Neovim config

Neovim is my main editor both at work and for my hobby projects. I invested
some time to adjust it for my needs so I thought it would be a waste not to
share it here.

## Quickstart

### With nix

You can instantly try it out with just this simple command:

```bash
nix run github:buglight/my-nvim-config
```

Or you can clone this repo, do some tweaks something and call `nix run` to see
the result right away.

### Manual installation

First of all install these:
- [neovim](https://github.com/neovim/neovim) (version >= 0.10.0) the editor
  itself
- [python](https://python.org) (version >= 3.14.0) required by some LSPs
- [nodejs](https://github.com/neovim/neovim) (version >= 21.0.0) required by
  some LSPs

After that clone this repo into your neovim configuration folder.

#### Linux/MacOS/Unix
```bash
git clone https://github.com/BugLight/my-nvim-config.git ~/.config/nvim
```

#### Windows
```
git clone https://github.com/BugLight/my-nvim-config.git "$env:LOCALAPPDATA/nvim"
```

## My favorite features

- [mellow.nvim](https://github.com/mellow-theme/mellow.nvim): A soothing dark
  colorscheme
- [Snacks.nvim](https://github.com/folke/snacks.nvim): a little bit of
  everything for convinience
- Treesitter with text objects and rainbow parentheses
- Configured LSP with code completion and convinient navigation
- Git integration: [fugitive](https://github.com/tpope/vim-fugitive) + [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
