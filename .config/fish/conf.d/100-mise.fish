if command -v mise &> /dev/null
  if ! command -v usage &> /dev/null
    echo "please install usage. ttps://usage.jdx.dev/cli/" >&2
  end

  mise activate fish | source
end
