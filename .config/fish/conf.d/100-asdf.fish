if [ -f ~/.asdf/asdf.fish ]
  source ~/.asdf/asdf.fish
end
if command -s brew > /dev/null
  if [ -f (brew --prefix asdf)/asdf.fish ]
    source (brew --prefix asdf)/asdf.fish
  end
end
