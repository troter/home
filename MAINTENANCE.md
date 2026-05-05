# Maintenance Notes

このリポジトリの運用上のメモ。残件・意図的な保留・環境前提を記録する。
セットアップ手順は [README.md](README.md) を参照。

## 保留中の懸念

将来見直す可能性がある事項。現状は意図して放置している。

### `.config/hg/hgrc` の include が未生成

`hgrc` は次の `.rc` を include するが、tracked されているのは `.in` テンプレートのみ。

```
%include $HOME/.config/hg/extensions.rc
%include $HOME/.config/hg/hooks.rc
%include $HOME/.config/hg/araxis.rc
%include $HOME/.config/hg/local.rc
```

新規マシンで hg を起動すると include エラーになる可能性がある。

→ hg を再び使う場面が来たら見直す。その際は `.in` → `.rc` への単純コピーではなく、現代的な hook の仕組み（hg extensions など）を含めて全体を再設計する想定。

### `cb` / `git-tmp` の `bundler/inline` 起動遅延

`~/.local/bin/cb` と `~/.local/libexec/git-tmp.rb` は `bundler/inline` で実行毎に gem を解決するため 1〜3 秒遅延する。

→ 体感を改善したくなったら `.default-gems` に `clipboard` / `thor` / `tty-command` を追加し、スクリプト側を `bundler/inline` から通常の `require` に切り替える。

## 意図的に残した dead-ish 設定

「使っていない」だけを理由に削除しない設定群。

### 別環境用の最低限フォールバック

不慣れな／一時的な環境（リモートサーバ、コンテナ内、共有マシン）で作業する際の自分向けバックアップ設定。日常的には未使用でもファイルは保持する。

- `.screenrc`
- `.vimrc`
- `.inputrc`

各ファイル内の確実に動かない記述（廃止された設定値、外部スクリプトに依存する化石コード）は削除して構わない。

### プレイスホルダーディレクトリ

将来用途のために空のまま残しているディレクトリ。

- `scripts/`
- `src/`
- `scripts/LaunchAgents/`

git は空ディレクトリを追跡しないため、worktree 上にのみ存在する。

### peco / percol

記念碑として保持。`peco` は fish の `^R` (`peco_select_history`) で日常的に使用。`percol` は `.config/peco/config.json` 等の歴史的設定とともに残置。

## 環境前提

### 主シェル

- 主シェル: **zsh**（`.config/zsh/` 以下、ohmyzsh 経由）
- 副シェル: **fish**（`.config/fish/` 以下、設定併存）

zsh に戻したのは 2024 年ごろ。再び fish に戻す可能性も残しているため、fish 設定は維持する。

### EDITOR

`EDITOR=vi` を fish / zsh 両方で設定。emacs を主エディタとして使っていても、シェルから呼ばれる軽量編集（`crontab -e`、`git commit` のメッセージエディタ、`visudo` 等）は vi で行う方針。

### Brewfile

`shells & runtimes` セクションで `fish` / `mise` / `pipx` まで含めて self-contained にしている。`brew bundle install --file ~/.Brewfile` だけで主要な依存が揃うことを目指す。

`mise` を入れた後は `mise install` で Ruby / Node / Python 等の言語ランタイムが揃う想定。Ruby は `.default-gems` の gem（`bundler` / `gem-src` / `irb` / `reline`）が自動で導入される。

### emacs

literate config（`config.org` / `early-config.org` を `org-babel-load-file` で読み込む）。パッケージ管理は **straight.el**（`.emacs.d/straight/versions/default.el` が lockfile としてコミットされている）。

### LaunchAgents

`~/.local/Library/LaunchAgents/` に `*.plist` を tracked に置き、初回セットアップで `rake install` を実行して `~/Library/LaunchAgents/` への symlink + `launchctl bootstrap` を行う。
