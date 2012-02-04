$HOME
=====

My home directory.

Installation
============

Clone repository and setup.

    hg clone https://bitbucket.org/troter/home $HOME/home
    mv $HOME/home/.hg $HOME/.hg
    mv $HOME/home/.hgignore $HOME/.hgignore
    hg revert --no-backup

Install from source code.

    cd $HOME/local/setup
    ./setup.sh
    # extract archives and install (using stow)

Install environment managers and install latest version.

- [rvm](https://github.com/wayneeseguin/rvm)
- [pythonbrew](https://github.com/utahta/pythonbrew)
- [perlbrew](https://github.com/gugod/App-perlbrew)
- [nvm](https://github.com/creationix/nvm)

Install gems.

    gem install pry

Install eggs.

    pip install virtualenv
    pip install mercurial
    pip install sphinx
    pip install ipythion
    pip install readline
