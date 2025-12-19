# Tools Role

## Overview

This role installs peco, a simplistic interactive filtering tool that is useful for command-line workflows.

## Description

The role installs `peco` using the appropriate package manager for each platform:

### For Debian/Ubuntu
- Installs via apt package manager
- Updates package cache before installation

### For macOS
- Installs via Homebrew

## Requirements

### Debian/Ubuntu
- sudo privileges (for apt package installation)
- Internet connection

### macOS
- Homebrew must be installed

## Platform Support

- Linux (Debian/Ubuntu)
- macOS (Darwin)

## What is Peco?

Peco is a simplistic interactive filtering tool that reads input from stdin, displays it in an interactive list, and outputs the selected items to stdout. It's commonly used for:

- Interactive command history search
- File navigation
- Git branch selection
- Process selection for kill commands
- And many other interactive filtering scenarios

## Example Usage

```yaml
- hosts: localhost
  roles:
    - tools
```

## Common Use Cases

### Interactive History Search (Zsh)
```zsh
# Add to your .zshrc
function peco-select-history() {
  BUFFER=$(history -n -r 1 | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history
```

### Git Branch Checkout
```bash
git branch | peco | xargs git checkout
```

For more information, visit: https://github.com/peco/peco
