#!/bin/env bash
set -euo pipefail

if [[ "$(uname)" == "Linux" ]] && ! command -v nix >/dev/null 2>&1; then
  sh <(curl -L https://nixos.org/nix/install) --no-daemon
  . "$HOME/.nix-profile/etc/profile.d/nix.sh"
fi

sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply no-yan
chezmoi init --apply no-yan --purge-binary
