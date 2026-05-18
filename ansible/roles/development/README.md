# Development Role

## Overview

This role installs mise version manager, which allows you to manage multiple runtime versions for various programming languages and tools.

## Description

### For Debian/Ubuntu Systems

1. Installs required dependencies for mise and language builds:
   - zlib1g-dev, libbz2-dev, libreadline-dev, libssl-dev
   - libsqlite3-dev, libffi-dev
   - git, bash, curl, gpg

2. Downloads and installs mise to `/usr/local/bin/mise` using the official install script.

### For macOS Systems

Installs mise via Homebrew

## Requirements

### Debian/Ubuntu
- sudo privileges (for apt package installation)
- Internet connection

### macOS
- Homebrew must be installed

## Platform Support

- Linux (Debian/Ubuntu) - Install script (installed to `/usr/local/bin/mise`)
- macOS (Darwin) - Homebrew installation

## Post-Installation

After installation, configure your shell to initialize mise. Add to your shell configuration:

```zsh
# For zsh
eval "$(mise activate zsh)"

# For bash
eval "$(mise activate bash)"
```

## Example Usage

```yaml
- hosts: localhost
  roles:
    - development
```

## What is mise?

mise (formerly rtx) is a polyglot runtime manager. Its features include:
- Fast: written in Rust, significantly faster than asdf.
- Compatible: supports asdf plugins and `.tool-versions` files.
- Simple: single binary, no shims required (optionally).

For more information, visit: https://mise.jdx.dev/
