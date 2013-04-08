$HOME
=====

My home directory.

Prepare for home directory
--------------------------

My home directory depends on some software. If you not install following software, see PREPARE.md.

- my favorite dvcs, mercural.
- compilers(gcc, g++) and development libraries.
- some useful command line tools(zsh, screen, curl, etc..).

Installation
------------

Clone repository and setup.

    hg clone https://bitbucket.org/troter/home $HOME/home
    mv $HOME/home/.hg $HOME/.hg
    mv $HOME/home/.hgignore $HOME/.hgignore
    hg revert --no-backup --all

Install from source code.

    cd $HOME/local/setup
    ./setup.sh
    # extract archives and install (using stow)

Install environment managers and install latest version.

    rake brew
    rake brew:install

Install gems.

    gem install pry pry-doc

Install eggs.

    pip install virtualenv virtualenvwrapper
    pip install mercurial
    pip install sphinx
    pip install bpython
    pip install readline
