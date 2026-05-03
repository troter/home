# $HOME

My home directory.

## Setup

The home directory itself is the working tree for the `main` branch; `~/.home` is a worktree on the `develop` branch for editing.

```
git clone https://github.com/troter/home /tmp/home
mv /tmp/home/.git $HOME/.git
rmdir /tmp/home
git restore .

git worktree add ~/.home develop
```

## Note

### Launch zsh from bash

```
$ echo '[ -n "$PS1" ] && which zsh &> /dev/null && exec zsh' >> .bashrc
```

### Launch fish from bash

```
$ echo '[ -n "$PS1" ] && which fish &> /dev/null && exec fish' >> .bashrc
```
