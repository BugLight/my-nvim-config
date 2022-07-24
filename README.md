# My Neovim config

## Quickstart

First of all install [Neovim](https://github.com/neovim/neovim) (version >= 0.7).

After that clone this repo into your neovim configuration folder.

### Linux/MacOS/Unix
```bash
git clone https://github.com/BugLight/my-nvim-config.git ~/.config/nvim
```

### Windows
```
git clone "$env:LOCALAPPDATA/nvim"
```


Install required plugins with command:
```
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
```
