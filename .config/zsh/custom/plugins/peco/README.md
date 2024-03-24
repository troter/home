# troter-peco

Port [percol plugin](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/percol) to peco.

Provides some useful function to make [peco](https://github.com/peco/peco) work with zsh history and
the [jump plugin](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/jump), optionally.

To use it, add `troter-peco` to the plugins array in your zshrc:

```zsh
plugins=(... troter-peco)
```

## Requirements

- `peco`: install with `brew install peco`.

- (_Optional_) [`jump`](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/jump) plugin: needs to be
  enabled before the `peco` plugin.

## Usage

- <kbd>CTRL-R</kbd> (bound to `peco_select_history`): you can use it to grep your history with peco.

- <kbd>CTRL-B</kbd> (bound to `peco_select_marks`): you can use it to grep your jump bookmarks with peco.
