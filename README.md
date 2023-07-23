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


### Dotfilesの更新を定期的に確認する

Cronでスクリプトを登録し、未反映の差分をチェックします。変更があった場合にはログが保存され、shellの読み込み時に表示されます。
`crontab -e` で以下のコマンドを登録してください。

```
0 8  * * * ~/scripts/chezmoi/check-update.sh
```


