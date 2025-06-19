# My Dotfiles

## 構成
- macOS: Brew bundleで管理
- Linux: Nixで管理
- プログラミング言語: miseで管理

## インストール

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b /usr/local/bin  init --apply no-yan
chezmoi init --apply no-yan --purge-binary
```

Linux環境では、初回実行時にNixが自動でインストールされ、`chezmoi apply` を再実行することで定義されたソフトウェアが更新されます。

