# homebrew
if command -v /opt/homebrew/bin/brew &> /dev/null
  /opt/homebrew/bin/brew shellenv fish | source
end

set -x HOMEBREW_NO_EMOJI 1
