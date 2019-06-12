[![Build Status](https://travis-ci.org/reireias/dotfiles.svg?branch=master)](https://travis-ci.org/reireias/dotfiles)

# dotfiles

reireias's dotfiles.

## Screenshot
### zsh
![dotfiles-zsh](https://user-images.githubusercontent.com/24800246/59350904-29d56480-8d58-11e9-9aa7-f943aa470bb9.png)

### vim
![dotfiles-vim](https://user-images.githubusercontent.com/24800246/59351009-686b1f00-8d58-11e9-8b0a-585e65a4a31c.png)

## Deploy
Create symbolic link dotfiles to your home directory.

```sh
./deploy.sh
```

## Initialize
Install packages and fonts.

```sh
./initialize.sh

# only zsh, zplug, plugins
./initialize.sh --zsh

# only font
./initialize.sh --font

# only neovim
./initialize.sh --neovim
```

### Initialize tmux
- Install [tmux](https://github.com/tmux/tmux) 2.8 or higher.
- Install [tpm](https://github.com/tmux-plugins/tpm) to ~/.tmux/plugins/tpm.
- Start tmux and input `prefix I` for install plugins.
