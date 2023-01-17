#!/bin/sh

set -e # -e: exit on error

if [ ! "$(command -v brew)" ]; then
  echo "Installing brew"
  if [ "$(command -v curl)" ]; then
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
  elif [ "$(command -v wget)" ]; then
    wget -qO- https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
  else
    echo "To install chezmoi, you must have curl or wget installed." >&2
    exit 1
  fi
else
  chezmoi=chezmoi
fi

# Seemingly EOF is not needed, but I'm not sure about handling errors in shell.
# https://www.chezmoi.io/user-guide/machines/macos/
brew bundle --no-lock --file=/dev/stdin <<EOF
EOF
