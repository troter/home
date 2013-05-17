if [ ! -s "$HOME/local/etc/profile.d/z.sh" ]; then
  curl -L "https://raw.github.com/rupa/z/v1.6/z.sh" -o "$HOME/local/etc/profile.d/z.sh"
  [ -f "$HOME/local/share/man/man1/z.1" ] && rm -f "$HOME/local/share/man/man1/z.1"
  curl -L "https://raw.github.com/rupa/z/v1.6/z.1" -o "$HOME/local/share/man/man1/z.1"
  touch "$HOME/.z"
fi
. "$HOME/local/etc/profile.d/z.sh"
