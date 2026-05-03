# homebrew mysql-client
if test -n "$HOMEBREW_PREFIX"; and test -d "$HOMEBREW_PREFIX/opt/mysql-client/bin"
  fish_add_path "$HOMEBREW_PREFIX/opt/mysql-client/bin"
  set -gx LDFLAGS "-L$HOMEBREW_PREFIX/opt/mysql-client/lib"
  set -gx CPPFLAGS "-I$HOMEBREW_PREFIX/opt/mysql-client/include"
  set -gx PKG_CONFIG_PATH "$HOMEBREW_PREFIX/opt/mysql-client/lib/pkgconfig"
end
