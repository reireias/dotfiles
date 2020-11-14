[![Actions Status](https://github.com/reireias/dotfiles/workflows/install/badge.svg)](https://github.com/reireias/dotfiles/actions) [![Actions Status](https://github.com/reireias/dotfiles/workflows/lint/badge.svg)](https://github.com/reireias/dotfiles/actions) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

# reireias's dotfiles

My dotfiles for Linux and OSX.

![terminal](https://user-images.githubusercontent.com/24800246/98963316-d4a01280-254a-11eb-962a-42fa758e44b5.png)

## Quick Start

- clone this repository
- `make dotfiles && make dependencies`

## Screenshots
- fuzzy file search with preview by [fzf](https://github.com/junegunn/fzf)  
  ![fzf-files](https://user-images.githubusercontent.com/24800246/99158555-62c8f400-2717-11eb-9d0a-58736ac201eb.png)
- prompt customize with [powerlevel10k](https://github.com/romkatv/powerlevel10k)  
  ![powerlevel10k](https://user-images.githubusercontent.com/24800246/99158960-a1f94400-271b-11eb-8d44-832103563088.png)
- [monokai](http://monokai.9x4.net/) like color  
  ![monokai](https://user-images.githubusercontent.com/24800246/99158941-75452c80-271b-11eb-9c1b-8409e53c3eda.png)
- [tmux](https://github.com/tmux/tmux) + [tmux-themepack](https://github.com/jimeh/tmux-themepack)  
  ![tmux-powerline](https://user-images.githubusercontent.com/24800246/99159052-7cb90580-271c-11eb-91b1-5fb5105ce085.png)
- vim - grep with preview by [fzf.vim](https://github.com/junegunn/fzf.vim)  
  ![vim-ag](https://user-images.githubusercontent.com/24800246/99159106-e9cc9b00-271c-11eb-97be-92b4fd1adace.png)
- vim - [coc.nvim](https://github.com/neoclide/coc.nvim) + LSP  
  ![vim-coc](https://user-images.githubusercontent.com/24800246/99159375-09fd5980-271f-11eb-9b8a-42289b5217b3.png)


## Details

### Installation
This dotfiles installation is managed by [Ansible](https://docs.ansible.com/) and Makefile.

`make dotfiles` create symbolic links in home directory.  
Files are created as symbolic links and directories are created as directories.

`make dependencies` installs packages, fonts and plugins.

These implementations can be found in the [ansible](ansible) directory.

### Customize iwith local rc files
The following script in `.zshrc` allows you to write machine-specific settings in the `.zshrc_local` file, such as a proxy.

```bash
if [[ -e ~/.zshrc_local ]]; then
    source ~/.zshrc_local
fi
```

The same is true for vimrc.

## Development
Run lint (shellcheck, ansible-lint, vint)

```console
$ make lint
```

Test .bashrc and .zshrc, check zsh plugin installed.

```console
$ make test
```
