#!/bin/bash
set -euo pipefail

REPO="reireias/dotfiles"
REPO_URL="https://github.com/${REPO}.git"
GHQ_PATH="${GOPATH:-${HOME}/dev}/src/github.com/${REPO}"

info() { printf '\033[1;34m[INFO]\033[0m %s\n' "$1"; }

install_prerequisites() {
  case "$(uname)" in
    Linux)
      info "Installing prerequisites (git, make, ansible)..."
      sudo apt update -qq
      sudo apt install -y -qq git make ansible
      ;;
    Darwin)
      if ! command -v brew > /dev/null 2>&1; then
        info "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      fi
      info "Installing prerequisites (git, make, ansible)..."
      brew install git make ansible
      ;;
    *)
      echo "Unsupported OS: $(uname)" >&2
      exit 1
      ;;
  esac
}

clone_repo() {
  if [[ -d "${GHQ_PATH}" ]]; then
    info "Repository already exists at ${GHQ_PATH}, pulling latest..."
    git -C "${GHQ_PATH}" pull
    return
  fi

  if command -v ghq > /dev/null 2>&1; then
    info "Cloning with ghq..."
    ghq get "${REPO_URL}"
  else
    info "Cloning to ${GHQ_PATH}..."
    git clone "${REPO_URL}" "${GHQ_PATH}"
  fi
}

setup_dotfiles() {
  info "Setting up dotfiles..."
  make -C "${GHQ_PATH}" dotfiles
}

install_dependencies() {
  info "Installing dependencies..."
  make -C "${GHQ_PATH}" dependencies
}

change_shell() {
  local zsh_path
  zsh_path="$(command -v zsh)"
  if [[ "$(basename "${SHELL}")" == "zsh" ]]; then
    info "Default shell is already zsh."
    return
  fi
  # chsh rejects shells not listed in /etc/shells (e.g. Linuxbrew zsh)
  if ! grep -qx "${zsh_path}" /etc/shells; then
    info "Adding ${zsh_path} to /etc/shells..."
    echo "${zsh_path}" | sudo tee -a /etc/shells > /dev/null
  fi
  info "Changing default shell to zsh..."
  chsh -s "${zsh_path}"
}

install_prerequisites
clone_repo
setup_dotfiles
install_dependencies
change_shell

info "Bootstrap complete!"
