#!/bin/sh
# Seemingly EOF is not needed, but I'm not sure about handling errors in shell.
# https://www.chezmoi.io/user-guide/machines/macos/
brew bundle --no-lock --file=/dev/stdin <<EOF
EOF
