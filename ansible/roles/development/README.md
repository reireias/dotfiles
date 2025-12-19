# Development Role

## Overview

This role installs asdf version manager, which allows you to manage multiple runtime versions for various programming languages and tools.

## Description

### For Debian/Ubuntu Systems

1. Installs required dependencies for asdf and language builds:
   - zlib1g-dev, libbz2-dev, libreadline-dev, libssl-dev
   - libsqlite3-dev, libffi-dev
   - git, bash, curl

2. Fetches the latest asdf version from GitHub releases API (fallback to v0.18.0)

3. Downloads and extracts the pre-compiled asdf binary to `/usr/local/bin`

4. Cleans up temporary installation files

### For macOS Systems

Installs asdf via Homebrew

## Requirements

### Debian/Ubuntu
- sudo privileges (for apt package installation)
- Internet connection

### macOS
- Homebrew must be installed

## Platform Support

- Linux (Debian/Ubuntu) - Pre-compiled binary installation
- macOS (Darwin) - Homebrew installation

## Post-Installation

After installation, configure your shell to initialize asdf. Add to your shell configuration:

```bash
# For Debian/Ubuntu
. /usr/local/bin/asdf

# For macOS (if installed via Homebrew)
. $(brew --prefix asdf)/libexec/asdf.sh
```

## Example Usage

```yaml
- hosts: localhost
  roles:
    - development
```

## What is asdf?

asdf is a CLI tool that manages multiple runtime versions for various languages like:
- Node.js
- Python
- Ruby
- Go
- And many more via plugins

For more information, visit: https://asdf-vm.com/
