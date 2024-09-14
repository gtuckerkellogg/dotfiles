#!/usr/bin/env bash


for D in .local/bin \
	 bin \
      	 .cabal/bin \
	 miniconda3/bin \
	 go/bin \
	 .cargo/bin ; do 
    [ -d "${HOME}/${D}" ] && PATH="${HOME}/${D}:$PATH"
done


export DOCKER_BUILDKIT=1
export TEMP=/tmp

export TMP=$TEMP

export ESHELL=/bin/bash

export DROPBOX=~/Dropbox
export REFDIR=${DROPBOX}/_reference

export BIBINPUTS=.:${REFDIR}/bib/bibtex

export PERL5LIB=~/lib/perl5/

export TEXMFHOME=~/Dropbox/lib/texmf
export TEXDOC=~/Dropbox/lib/texmf

export NODE_PATH=/usr/local/lib/node_modules

export CLOJURESCRIPT_HOME=${HOME}/lib/clojurescript

export R_LIBS_USER=${HOME}/lib/R

export LANG=en_US.UTF-8
export LC_ALL=C


joinByChar() {
  local IFS="$1"
  shift
  echo "$*"
}

function slimpath() {
    local string="$PATH";
    readarray -td: a <<< ".:${string}";
    for i in ${!a[@]}; do [[ -z ${a[i]} ]] && unset a[i]; done
    for i in ${!a[@]}; do a[i]=${a[i]%/} ; done
    string=$(joinByChar : "${a[@]}")
    string=$(echo "$string" | awk -v RS=':' -v ORS=":" '!a[$1]++')
    string=${string%:}
    export PATH="${string}"
}


if [ -d ~/perl5/perlbrew/etc ] ; then 
    source ~/perl5/perlbrew/etc/bashrc
    source ~/perl5/perlbrew/etc/perlbrew-completion.bash
fi

if [ -f "/usr/share/modules/init/bash" ] ; then 
    source /usr/share/modules/init/bash
fi

hostname=$(hostname)
host_specific_profile="${HOME}/src/dotfiles/hosts/${hostname}_profile"
if [ -f "${host_specific_profile}" ] ; then
    source "${host_specific_profile}"
fi

if [ -f "${HOME}/.secrets.sh" ] ; then 
    source ~/.secrets.sh
fi

if [ -f "${HOME}/.rbenv/bin/rbenv" ] ; then 
    eval "$(${HOME}/.rbenv/bin/rbenv init - bash)"
fi


slimpath


case "$-" in 
    *i*) source ${HOME}/.bashrc
esac

