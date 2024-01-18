#!/bin/bash

if [ -d "$HOME/.local/bin" ] ; then
    PATH=.:${HOME}/.local/bin:${PATH}
fi

if [ -d "$HOME/.cabal/bin" ] ; then
    PATH=.:${HOME}/bin:${HOME}/.cabal/bin:${PATH}
else
    PATH=.:${HOME}/bin:${PATH}
fi

export DOCKER_BUILDKIT=1
export TEMP=/tmp

export TMP=$TEMP

# Put my bowtie indices here

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

case "$-" in 
    *i*) source ${HOME}/.bashrc
esac

function slimpath() { 
    PATH=$(echo "$PATH" | awk -v RS=':' -v ORS=":" '!a[$1]++')
    PATH=$(echo "$PATH" | sed s/::/:/g | sed s/:$//)
}


# echo setenv PATH \"$PATH\" >| ~/.launchd.conf
# #defaults write $HOME/.MacOSX/environment PATH \"$PATH\"
# #plutil -convert xml1 .MacOSX/environment.plist 

if [ -d ~/perl5/perlbrew/etc ] ; then 
    source ~/perl5/perlbrew/etc/bashrc
    source ~/perl5/perlbrew/etc/perlbrew-completion.bash
fi

if [ -f "/usr/share/modules/init/bash" ] ; then 
    source /usr/share/modules/init/bash
fi

if [ -d ~/miniconda3/bin ] ; then
    export PATH="/home/gtk/miniconda3/bin:$PATH"
fi

if [ -d ~/go/bin ] ; then
    export PATH="${HOME}/go/bin:${PATH}"
fi

export PATH="$HOME/.cargo/bin:$PATH"

hostname=$(hostname)
host_specific_profile="${HOME}/src/dotfiles/hosts/${hostname}_profile"
if [ -f "${host_specific_profile}" ] ; then
    echo "found it"
    source "${host_specific_profile}"
fi

if [ -f "${HOME}/.secrets.sh" ] ; then 
    source ~/.secrets.sh
fi


eval "$(${HOME}/.rbenv/bin/rbenv init - bash)"

slimpath


