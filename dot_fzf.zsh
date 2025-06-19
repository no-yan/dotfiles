# Setup fzf
# ---------
if command -v fzf >/dev/null 2>&1; then
  fzf_prefix="$(dirname $(dirname $(command -v fzf)))"
  if [[ ! "$PATH" == *$fzf_prefix/bin* ]]; then
    export PATH="${PATH:+${PATH}:}$fzf_prefix/bin"
  fi
  [[ $- == *i* ]] && source "$fzf_prefix/share/fzf/shell/completion.zsh" 2>/dev/null
  source "$fzf_prefix/share/fzf/shell/key-bindings.zsh" 2>/dev/null
fi
