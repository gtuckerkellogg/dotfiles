#!/bin/bash

eval `/usr/libexec/path_helper -s`

export PATH=${HOME}/bin:/usr/local/bin::/usr/local/Cellar/ruby/1.9.3-p0/bin:/usr/local/sbin:/usr/local/mysql/bin:${PATH}:
PATH=/usr/local/Cellar/ruby/1.9.3-p194/bin:$PATH
PATH=${PATH}:/usrlocal/share/npm/node
PATH=/Applications/Emacs.App/Contents/MacOS:${PATH}

export LD_LIBRARY_PATH=/usr/local/mysql/lib/

export TEMP=/var/tmp/
export R_ARCH=/x86_64

export TMP=$TEMP
export CLASSPATH=~/Library/Clojure/lib

# Put my bowtie indices here

export BOWTIE_INDEXES=/var/bowtie

export DROPBOX=~/Dropbox
export REFDIR=${DROPBOX}/_reference

export FORTRAN=gfortran

export BIBINPUTS=${REFDIR}/bib/bibtex

export PERL5LIB=~/lib/perl5/

export TEXMFHOME=~/Dropbox/lib/texmf:~/Library/texmf

export NODE_PATH=/usr/local/lib/node_modules

export CLOJURESCRIPT_HOME=${HOME}/lib/clojurescript

export PYTHONPATH=${HOME}/lib/python

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

case "$-" in 
    *i*) source ${HOME}/.bashrc
esac


PATH=$(echo "$PATH" | awk -v RS=':' -v ORS=":" '!a[$1]++')

##
# Your previous /Users/gtuckerkellogg/.bash_profile file was backed up as /Users/gtuckerkellogg/.bash_profile.macports-saved_2012-10-30_at_20:49:30
##

