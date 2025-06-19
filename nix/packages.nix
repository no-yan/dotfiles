{ pkgs ? import <nixpkgs> {} }:
with pkgs; [
  bat
  findutils
  fzf
  gcc
  gh
  ghq
  git
  git-delta
  gnupg
  gnutls
  grep
  httpie
  hyperfine
  jq
  lazygit
  mise
  neovim
  ripgrep
  starship
  tree
  tree-sitter
  watchexec
]
