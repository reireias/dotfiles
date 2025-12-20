[![Actions Status](https://github.com/reireias/dotfiles/workflows/install/badge.svg)](https://github.com/reireias/dotfiles/actions) [![Actions Status](https://github.com/reireias/dotfiles/workflows/lint/badge.svg)](https://github.com/reireias/dotfiles/actions) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

# reireias's dotfiles

My dotfiles for Linux and macOS.

<img width="1262" height="874" alt="Image" src="https://github.com/user-attachments/assets/4f7f022a-d5d5-4a07-94ab-b37bd9180ab2" />

<img width="1262" height="874" alt="Image" src="https://github.com/user-attachments/assets/ffba0186-d563-4f62-9c0e-6cf1f4555f33" />

<img width="1262" height="874" alt="Image" src="https://github.com/user-attachments/assets/ae01bc98-0847-4d37-b563-4f304e43a426" />

## Quick Start

- clone this repository
- `make dotfiles && make dependencies`

## Features

- **Shell**: zsh with [zi](https://github.com/z-shell/zi) plugin manager
- **Prompt**: [powerlevel10k](https://github.com/romkatv/powerlevel10k)
- **Search**: fuzzy file search with [fzf](https://github.com/junegunn/fzf)
- **Editor**: Neovim with [lazy.nvim](https://github.com/folke/lazy.nvim)
- **Terminal Multiplexer**: [tmux](https://github.com/tmux/tmux)

<!-- TODO: Add screenshots for current setup -->


## Details

### Installation
This dotfiles installation is managed by [Ansible](https://docs.ansible.com/) and Makefile.

`make dotfiles` create symbolic links in home directory.  
Files are created as symbolic links and directories are created as directories.

`make dependencies` installs packages and plugins.

These implementations can be found in the [ansible](ansible) directory.

### Customize with local rc files
The following script in `.zshrc` allows you to write machine-specific settings in the `.zshrc_local` file, such as a proxy.

```bash
if [[ -e ~/.zshrc_local ]]; then
    source ~/.zshrc_local
fi
```

The same is true for vimrc.

## Development
Run lint (shellcheck, ansible-lint)

```console
$ make lint
```

Test .bashrc and .zshrc syntax.

```console
$ make test
```

## Test on Docker

```console
$ docker run --rm -it -u ubuntu reireias/non-root-user-ubuntu:22.04 bash
$ sudo apt update
$ cd
$ git clone https://github.com/reireias/dotfiles.git
$ cd dotfiles
$ make dotfiles
$ make dependencies
$ zsh

# onliner
$ sudo apt update && cd && git clone https://github.com/reireias/dotfiles.git && cd dotfiles && make dotfiles && make dependencies && zsh
```
