#!/bin/bash

eval `/usr/libexec/path_helper -s`

export PATH=${HOME}/bin:/usr/local/bin:/opt/local/bin:/usr/local/Cellar/ruby/1.9.3-p0/bin:/usr/local/sbin:/usr/local/mysql/bin:${PATH}:

# For the MacOS, want to make sure the most recent version of emacs
# is used

PATH=/Applications/Emacs.App/Contents/MacOS/:${PATH}

export LD_LIBRARY_PATH=/usr/local/mysql/lib/
export DYLD_LIBRARY_PATH=$LD_LIBRARY_PATH

export TEMP=/var/tmp/
export R_ARCH=/x86_64

export TMP=$TEMP
export CLASSPATH=~/Library/Clojure/lib

export DROPBOX=~/Dropbox
export REFDIR=${DROPBOX}/_reference

export BIBINPUTS=${REFDIR}/bib/bibtex
export LOCALTEXMF=${REFDIR}/latex

export PERL5LIB=~/lib/perl5/


export NODE_PATH=/usr/local/lib/node_modules

export CLOJURESCRIPT_HOME=${HOME}/lib/clojurescript

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

case "$-" in 
    *i*) source ${HOME}/.bashrc
esac
