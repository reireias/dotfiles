[![Build Status](https://travis-ci.org/reireias/dotfiles.svg?branch=master)](https://travis-ci.org/reireias/dotfiles)

# dotfiles

reireias's dotfiles.

## Deploy
Deploy dotfiles to your home directory.

```sh
cd /path/to/dotfiles
./deploy.sh
```

## Initialize
Install packages and fonts.

```sh
cd /path/to/dotfiles
./initialize.sh
```

### Initialize tmux
- Install [tmux](https://github.com/tmux/tmux) 2.8 or higher.
- Install [tpm](https://github.com/tmux-plugins/tpm) to ~/.tmux/plugins/tpm.
- Start tmux and input `prefix I` for install plugins.
