#!/bin/env bash
set -euo pipefail
sh -c "$(curl -fsLS get.chezmoi.io)" init --apply no-yan
chezmoi init --apply no-yan --purge-binary
