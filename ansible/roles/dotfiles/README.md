# Dotfiles Role

## Overview

This role creates symbolic links for dotfiles and dotdirs from the repository to the home directory, enabling easy management of configuration files across systems.

## Description

The role performs the following tasks:

1. **Dotfiles Linking**: Finds all hidden files (starting with `.`) in the repository root and creates symbolic links in the home directory
   - Excludes: `.gitignore`, `.travis`, `.shellcheckrc`, `.ansible-lint`

2. **Dotdirs Linking**: Finds all hidden directories in the repository root and creates symbolic links for all files within them
   - Excludes: `.git`, `.claude` directories
   - Recursively processes all files within included dotdirs
   - Creates necessary directory structure in the home directory

## Requirements

None

## Platform Support

- Linux (Debian/Ubuntu)
- macOS (Darwin)

## Example Usage

```yaml
- hosts: localhost
  roles:
    - dotfiles
```

## What Gets Linked

- All hidden files in repository root (e.g., `.zshrc`, `.gitconfig`)
- All files within hidden directories (e.g., files in `.config/`)
- Links are created with force, overwriting existing files/links
