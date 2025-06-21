{ pkgs ? import <nixpkgs> {} }:
with pkgs; [
  bat
  findutils
  fzf
  gcc
  gh
  ghq
  git
  gnugrep
  gnupg
  gnutls
  httpie
  hyperfine
  jq
  lazygit
  mise
  neovim
  neovim
  ripgrep
  starship
  tree
  tree-sitter
  watchexec
  zsh-powerlevel10k
]
