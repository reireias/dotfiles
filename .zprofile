# include .zshrc if it exists
if [ -f "$HOME/.zshrc" ]; then
  # shellcheck disable=SC1091
  . "$HOME/.zshrc"
fi
