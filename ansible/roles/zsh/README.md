# Zsh Role

## Overview

This role installs Zsh shell and its required dependencies for both Debian-based Linux systems and macOS.

## Description

The role installs the following packages:

### For Debian/Ubuntu
- `zsh` - Z shell
- `curl` - Command-line tool for transferring data
- `gawk` - GNU implementation of AWK

### For macOS
- `zsh` - Z shell
- `curl` - Command-line tool for transferring data
- `gawk` - GNU implementation of AWK
- `coreutils` - GNU core utilities

## Requirements

### Debian/Ubuntu
- sudo privileges (for apt package installation)
- Internet connection

### macOS
- Homebrew must be installed

## Platform Support

- Linux (Debian/Ubuntu)
- macOS (Darwin)

## Post-Installation

After installation, you may want to:

1. Set Zsh as your default shell:
```bash
chsh -s $(which zsh)
```

2. Configure Zsh by setting up your `.zshrc` file (typically managed by the dotfiles role)

## Example Usage

```yaml
- hosts: localhost
  roles:
    - zsh
```

## Notes

- On Debian/Ubuntu, the package cache is updated before installation
- The installed packages provide the foundation for advanced Zsh configurations and plugins
