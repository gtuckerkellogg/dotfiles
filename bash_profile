#!/bin/bash

if [ $(uname) = 'Darwin' ] ; then 
    eval `/usr/libexec/path_helper -s`
    export PATH=/usr/local/bin:/usr/local/Cellar/ruby/1.9.3-p0/bin:/usr/local/sbin:/usr/local/mysql/bin:${PATH}:
    PATH=/Applications/Emacs.App/Contents/MacOS:/Applications/Emacs.App/Contents/MacOS/bin:${PATH}
    PATH=/usr/local/Cellar/ruby/1.9.3-p194/bin:$PATH
    PATH=${PATH}:/usr/local/share/npm/bin
    #PATH=/usr/local/share/python:${PATH}
    export CLASSPATH=~/Library/Clojure/lib
    export FORTRAN=gfortran
fi

PATH=.:${HOME}/bin:${PATH}


export TEMP=/var/tmp/

export TMP=$TEMP

# Put my bowtie indices here

export BOWTIE_INDEXES=/var/bowtie
export BOWTIE2_INDEXES=/var/bowtie2

export DROPBOX=~/Dropbox
export REFDIR=${DROPBOX}/_reference

export BIBINPUTS=${REFDIR}/bib/bibtex

export PERL5sLIB=~/lib/perl5/

export TEXMFHOME=~/Dropbox/lib/texmf
export TEXDOC=~/Dropbox/lib/texmf

export NODE_PATH=/usr/local/lib/node_modules

export CLOJURESCRIPT_HOME=${HOME}/lib/clojurescript

export PYTHONPATH=${DROPBOX}/lib/python

export R_LIBS_USER=${HOME}/lib/R


# Setting up the VirtualEnv
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2.7
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
export VIRTUALENV_DISTRIBUTE=true
export PIP_VIRTUALENV_BASE=$WORKON_HOME
#export PIP_REQUIRE_VIRTUALENV=true
export PIP_RESPECT_VIRTUALENV=true
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

if [[ -r /usr/local/share/python/virtualenvwrapper.sh ]]; then
    source /usr/local/share/python/virtualenvwrapper.sh
fi

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# if [ -f `brew --prefix`/etc/bash_completion ]; then
#     . `brew --prefix`/etc/bash_completion
# fi

case "$-" in 
    *i*) source ${HOME}/.bashrc
esac


PATH=$(echo "$PATH" | awk -v RS=':' -v ORS=":" '!a[$1]++')


# echo setenv PATH \"$PATH\" >| ~/.launchd.conf
# #defaults write $HOME/.MacOSX/environment PATH \"$PATH\"
# #plutil -convert xml1 .MacOSX/environment.plist 

# source ~/perl5/perlbrew/etc/bashrc
# perlbrew use perl-5.18.0

export ORG_HOME=~/.emacs.d/elpa/org-20140331


