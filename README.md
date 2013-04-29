$HOME
=====

My home directory.

Prepare for home directory
--------------------------

My home directory depends on some software.

- my favorite dvcs, mercural.
- compilers(gcc, g++) and development libraries.
- some useful command line tools(zsh, screen, curl, etc..).

If you not install these software, see next command output.

    rake prepare

Installation
------------

Using curl one liner.

    curl -L https://bitbucket.org/troter/home/raw/default/scripts/install.sh | bash

Install from source code.

    cd $HOME/local/setup
    ./setup.sh
    # extract archives and install (using stow)

Install environment managers and install latest version.

    rake brew
    rake brew:pyenv:install brew:rbenv:install

Install mercurial extensions.

    rake mercurial:extensions:install

Install gems.

    gem install pry pry-doc

Install eggs.

    pip install virtualenv virtualenvwrapper
    pip install mercurial
    pip install sphinx
    pip install bpython
    pip install readline
    pip install percol
