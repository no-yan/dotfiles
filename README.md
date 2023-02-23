## My Dotfiles

アプリケーションはBrew caskで管理しています。
asdf, zsh, brew, starship

### Install with curl

`sh -c "$(curl -fsLS get.chezmoi.io)" -- -b /usr/local/bin  init --apply no-yan`

### With Brew

```sh
/bin/bash -c "$(curl -fsSL <https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh>)"
chezmoi init --apply no-yan
```
