[![Actions Status](https://github.com/reireias/dotfiles/workflows/install/badge.svg)](https://github.com/reireias/dotfiles/actions) [![Actions Status](https://github.com/reireias/dotfiles/workflows/lint/badge.svg)](https://github.com/reireias/dotfiles/actions) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

# dotfiles

reireias's dotfiles.

## Screenshot
### terminal(tmux + zsh)
![dotfiles-terminal](https://user-images.githubusercontent.com/24800246/98457020-b9d64280-21c6-11eb-85d9-c122969b30d1.png)

### vim
![dotfiles-vim](https://user-images.githubusercontent.com/24800246/98457050-09b50980-21c7-11eb-8d99-2f3183e60b6e.png)

## Quick Start

- clone this repository
- `make dotfiles && make dependencies`

## deploy dotfiles
Create symbolic link dotfiles to your home directory.

```console
$ make dotfiles
```

## install dependencies
Install packages and fonts.

- Ricty + Nerd Font + powerline font
- neovim
- zsh and zsh plugins
- asdf-vm
- some packages to use .zshrc

```console
$ make dependencies
```

## for developer
Run lint (shellcheck, ansible-lint, vint)

```console
$ make lint
```

Test .bashrc and .zshrc, check zsh plugin installed.

```console
$ make test
```
