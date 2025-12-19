# Neovim Role

## Overview

This role installs Neovim, a modern extensible text editor based on Vim.

## Description

The role currently supports installation on Debian-based Linux systems only.

### For Debian/Ubuntu
- Installs the `neovim` package via apt

## Requirements

### Debian/Ubuntu
- sudo privileges (for apt package installation)
- Internet connection

## Platform Support

- Linux (Debian/Ubuntu) ✓
- macOS (Darwin) - Not currently supported by this role

## Post-Installation

After installation, you can:

1. Launch Neovim:
```bash
nvim
```

2. Configure Neovim via configuration files (typically managed by the dotfiles role):
   - `~/.config/nvim/init.vim` or `~/.config/nvim/init.lua`

## Example Usage

```yaml
- hosts: localhost
  roles:
    - neovim
```

## Notes

- For macOS users, consider installing Neovim via Homebrew manually or extending this role
- Neovim configuration is typically stored in `~/.config/nvim/`
- The role only handles installation; configuration should be managed separately (e.g., via dotfiles role)
