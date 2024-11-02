# My Dotfiles

## 構成
- アプリケーション: Brew bundleで管理
- プログラミング言語: miseで管理

## インストール

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b /usr/local/bin  init --apply no-yan
chezmoi init --apply no-yan --purge-binary
```

