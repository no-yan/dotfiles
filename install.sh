#!/bin/env bash
set -euo pipefail
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b /usr/local/bin  init --apply no-yan
chezmoi init --apply no-yan --purge-binary
