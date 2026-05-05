# homebrew
for prefix in /opt/homebrew /usr/local
  if test -x "$prefix/bin/brew"
    "$prefix/bin/brew" shellenv fish | source
    break
  end
end

set -x HOMEBREW_NO_EMOJI 1
