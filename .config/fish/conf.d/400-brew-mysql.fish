# homebrew mysql-client
if [ -d /usr/local/opt/mysql-client/bin ]
  set -g fish_user_paths "/usr/local/opt/mysql-client/bin" $fish_user_paths
  set -gx LDFLAGS "-L/usr/local/opt/mysql-client/lib"
  set -gx CPPFLAGS "-I/usr/local/opt/mysql-client/include"
  set -gx PKG_CONFIG_PATH "/usr/local/opt/mysql-client/lib/pkgconfig"
end
