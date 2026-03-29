---
name: suggest-commit
description: >
  This skill should be used when the user says things like: コミットメッセージを書いて、
  commit message を作って、コミットメッセージを提案して、ステージした変更のコミットメッセージを考えて、
  コミットして、この変更をコミット、コミットメッセージを生成して、
  write a commit message, suggest commit message, generate commit message.
  git staged changes を分析し、Conventional Commits ルールに従ったコミットメッセージを提案する。
argument-hint: "[追加の指示（例: 'bodyは不要' '英語で')]"
---

# コミットメッセージ作成

ステージされた変更からコミットルールに従ったコミットメッセージを提案する。

## 手順

1. `git diff --cached` でステージされた変更を確認する
2. 変更がなければ「ステージされた変更がありません」と伝えて終了する
3. コミットルール（`~/.claude/rules/commit.md`）に従い、subject + body のコミットメッセージを提案する
4. 変更が複数の目的を含む場合は、コミットを分割すべき旨を指摘し、どのファイル・ハンクをどのコミットに含めるか分割案を提示する
5. コミットメッセージをコードブロックで提示し、ユーザーが承認したら HEREDOC 形式で `git commit` を実行する

## git commit の実行方法

ユーザーが承認したら、HEREDOC 形式で `git commit` を実行する。メッセージ末尾には `Co-Authored-By` シグニチャを付与する。

## 重要なポイント

- 1コミット1目的の原則を守る

## 引数の扱い

ユーザーから追加の指示（引数）が渡された場合、その指示をメッセージ作成に反映する。例:

- 「bodyは不要」→ subject のみを提案する
- 「英語で」→ subject と body を英語で記述する
