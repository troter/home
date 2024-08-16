# $HOME

My home directory.

## Setup

```
git clone https://github.com/troter/home .home
cp -R .home/.git $HOME/.git
git restore .
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
