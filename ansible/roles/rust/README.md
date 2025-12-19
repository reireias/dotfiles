# Rust Role

## Overview

This role installs Rust programming language and its toolchain using rustup, the official Rust installer and version manager.

## Description

The role performs the following tasks:

1. Checks if Rust is already installed by looking for the `~/.cargo` directory
2. If not installed:
   - Downloads the official rustup installation script from https://sh.rustup.rs
   - Runs the script in non-interactive mode (`-y` flag)
   - Installs the stable Rust toolchain by default

## Requirements

- Internet connection to download rustup
- `curl` or `wget` available on the system

## Platform Support

- Linux (Debian/Ubuntu)
- macOS (Darwin)
- Any Unix-like system supported by rustup

## Post-Installation

After installation, you need to configure your shell environment:

```bash
# Add to your .zshrc or .bashrc
source $HOME/.cargo/env
```

Or restart your shell to apply the changes.

## What Gets Installed

- `rustup` - Rust toolchain installer and version manager
- `cargo` - Rust package manager and build tool
- `rustc` - Rust compiler
- Standard library and documentation

## Example Usage

```yaml
- hosts: localhost
  roles:
    - rust
```

## Verify Installation

After installation, verify that Rust is correctly installed:

```bash
rustc --version
cargo --version
```

## Notes

- The installation is idempotent - it will skip if `~/.cargo` already exists
- Default installation includes the stable toolchain
- You can manage additional toolchains (nightly, beta) using `rustup` after installation
