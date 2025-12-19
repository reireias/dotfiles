# Homebrew Role

## Overview

This role installs Homebrew (Linuxbrew) on Debian-based Linux systems, providing access to the Homebrew package manager.

## Description

The role performs the following tasks on Debian systems:

1. Checks if Homebrew is already installed
2. Downloads the official Homebrew installation script if not present
3. Runs the installation script in CI mode (non-interactive)
4. Configures the shell environment by writing Homebrew environment variables to `~/.linuxbrewrc`

## Requirements

- Internet connection to download Homebrew installer
- `curl` must be available on the system

## Platform Support

- Linux (Debian/Ubuntu)
- **Note**: macOS does not use this role as Homebrew is typically pre-installed or managed differently

## Environment Configuration

After installation, the role creates `~/.linuxbrewrc` containing Homebrew environment variables. You should source this file in your shell configuration:

```bash
# Add to your .zshrc or .bashrc
[ -f ~/.linuxbrewrc ] && source ~/.linuxbrewrc
```

## Example Usage

```yaml
- hosts: localhost
  roles:
    - homebrew
```

## Installation Details

- Installation script URL: `https://raw.githubusercontent.com/Homebrew/install/master/install.sh`
- Installation path: `/home/linuxbrew/.linuxbrew/`
- The installation is idempotent - it will skip if Homebrew is already installed
