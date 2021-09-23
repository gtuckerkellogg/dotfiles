#!/bin/bash


echo "running .bash_profile"
# gems

if [[ -d "${HOME}/.gem" ]] ; then
    export GEM_HOME=${HOME}/.gem
    PATH=.:${HOME}/.gem/bin:${PATH}
fi

PATH=.:${HOME}/bin:${PATH}
PATH=.:${HOME}/.local/bin:${PATH}

## Go language

export GOPATH=${HOME}/go
export PATH=.:${GOPATH}/bin:$PATH

export TEMP=/var/tmp/

export TMP=$TEMP

# Put my bowtie indices here

export BOWTIE_INDEXES=/mnt/data/bowtie
export BOWTIE2_INDEXES=/mnt/data/bowtie2

export DROPBOX=~/Dropbox
export REFDIR=${DROPBOX}/_reference

export BIBINPUTS=${REFDIR}/bib/bibtex

export TEXMFHOME=~/Dropbox/lib/texmf
export TEXDOC=~/Dropbox/lib/texmf

export NODE_PATH=/usr/local/lib/node_modules

export CLOJURESCRIPT_HOME=${HOME}/lib/clojurescript

export R_LIBS_USER=${HOME}/lib/R


export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8


PATH=$(echo -n $PATH | awk -v RS=: '!($0 in a) {a[$0]; printf("%s%s", length(a) > 1 ? ":" : "", $0)}')

export __BASH_PROFILE_FINISHED=YES

echo "finished .bash_profile"
