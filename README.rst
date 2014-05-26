$HOME
=====

My home directory.

Install
-------

Using curl one liner::

  $ curl -L https://bitbucket.org/troter/home/raw/default/scripts/install.sh | bash

Install Depends software
------------------------

My home directory depends on some software.

- my favorite dvcs, mercural.
- compilers(gcc, g++) and development libraries.
- some useful command line tools(zsh, screen, curl, etc..).

If you not install these software, see following command output::

  $ rake prepare

Install Extra software
----------------------

Environment managers and latest version::

  $ rake brew:pyenv:install brew:rbenv:install
  $ source .zshrc
  $ pyenv install 2.7.4; pyenv rehash
  $ rbenv install 1.9.3; rbenv rehash

Emacs dependencies manager::

  $ curl -fsSkL https://raw.github.com/cask/cask/master/go | python

Mercurial extensions::

  $ rake mercurial:extensions

Useful gems::

  $ gem install pry pry-doc
  $ rbenv rehash

Useful eggs::

  $ pip install virtualenv virtualenvwrapper
  $ pip install mercurial dulwich
  $ pip install sphinx
  $ pip install bpython
  $ pip install readline
  $ pip install percol
  $ pyenv rehash

Launch zsh from bash
--------------------

If use local install zsh, run following command::

  $ echo '[ -n "$PS1" ] && which zsh &> /dev/null && exec zsh' >> .bashrc
