#!/bin/bash

exists() {
  if command -v $1 $>/dev/null; then
    return 0
  else
    return 1
  fi
}

if [ -e "$HOME/.hg" ]; then
  echo "Already installed!"
  exit 1
fi

CLONE_URL="https://bitbucket.org/troter/home"
TEMP_DIR=$(mktemp -d -t tmp.XXXXXXXX || echo "/tmp")

exists hg
if [ $? -ne 0 ]; then
  if [ -f "/etc/lsb-release" ] && grep -q DISTRIB_ID /etc/lsb-release; then
    platform=$(grep DISTRIB_ID /etc/lsb-release | cut -d "=" -f 2 | tr '[A-Z]' '[a-z]')
  elif [ -f "/etc/devian_version" ]; then
    platform="debian"
  elif [ -f "/etc/redhat-release" ]; then
    platform="el"
  elif [ -f "/etc/system-release" ]; then
    platform=$(sed 's/^\(.\+\) release.\+/\1/' /etc/system-release | tr '[A-Z]' '[a-z]')
    # amazon is built off of fedora, so act like RHEL
    if [ "$platform" = "amazon linux ami" ]; then
      platform="el"
    fi
  elif [ -f "/usr/bin/sw_vers" ]; then
    platform="mac_os_x"
  elif [ -f "/etc/release" ]; then
    platform="solaris2"
  elif [ -f "/etc/SuSE-release" ]; then
    platform="suse"
  elif [ -f "/etc/arch-release" ]; then
    platform="arch"
  fi

  echo "Can not found mercurial. please install by following command:"
  case $platform in
    "debian" | "ubuntu")
      echo "  apt-get install mercurial"
      ;;
    "el")
      echo "  yum install mercurial"
      ;;
    "suse")
      echo "  zypper install mercurial"
      ;;
    "arch")
      echo "  pacman -Syy mercurial"
      ;;
    "solaris2")
      echo "  pkg install mercurial"
      ;;
    "mac_os_x")
      echo "  brew install mercurial"
      echo "  pip install mercurial"
      ;;
    *)
      echo "  pip install mercurial"
      ;;
  esac

  exit 1
fi

cleanup_clone() {
  [ -e "$TEMP_DIR/home" ] && rm -rf "$TEMP_DIR/home"
}

echo "Cloning $CLONE_URL"
cleanup_clone
hg clone $CLONE_URL $TEMP_DIR/home
if [ $? -ne 0 ]; then
  echo "Cannnot clone $CLONE_URL"
  cleanup_clone
  exit 1
fi

echo "Installing into $HOME"
mv $TEMP_DIR/home/.hg $HOME/.hg
hg revert -R $HOME $HOME/.hgignore --no-backup
hg revert -R $HOME --no-backup --all
cleanup_clone

if [ "$TEMP_DIR" != "/tmp" ]; then
  rm -r "$TEMP_DIR"
fi

if [ $? -ne 0 ]; then
  echo "Installation failed"
  exit 1
fi
