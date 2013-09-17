# my $HOME/.bashrc file
# Last modified Time-stamp: <2012-03-17 22:50:47 gtuckerkellogg>
#
# This file is read (normally) by interactive shells only.
# Here is the place to define your aliases, functions and
# other interactive features like your prompt.
#


#-------------------------------------------------------------
# Automatic setting of $DISPLAY (if not set already).
# This works for linux - your mileage may vary. ...
# The problem is that different types of terminals give
# different answers to 'who am i' (rxvt in particular can be
# troublesome).
# I have not found a 'universal' method yet.
#-------------------------------------------------------------

export TERM=xterm-256color


function get_xserver ()
{
    case $TERM in
       xterm )
            XSERVER=$(who am i | awk '{print $NF}' | tr -d ')''(' )
            # Ane-Pieter Wieringa suggests the following alternative:
            # I_AM=$(who am i)
            # SERVER=${I_AM#*(}
            # SERVER=${SERVER%*)}

            XSERVER=${XSERVER%%:*}
            ;;
        aterm | rxvt)
        # Find some code that works here. ...
            ;;
    esac
}

if [ -z ${DISPLAY:=""} ]; then
    get_xserver
    if [[ -z ${XSERVER}  || ${XSERVER} == $(hostname) || \
      ${XSERVER} == "unix" ]]; then
        DISPLAY=":0.0"          # Display on local host.
    else
        DISPLAY=${XSERVER}:0.0  # Display on remote host.
    fi
fi

export DISPLAY

#-------------------------------------------------------------
# Some settings
#-------------------------------------------------------------

ulimit -S -c 0          # Don't want any coredumps.
set -o notify
set -o noclobber
set -o ignoreeof
#set -o nounset
#set -o xtrace          # Useful for debuging.

# Enable options:
shopt -s cdspell
shopt -s cdable_vars
shopt -s checkhash
shopt -s checkwinsize
shopt -s sourcepath
shopt -s no_empty_cmd_completion
shopt -s cmdhist
shopt -s histappend histreedit histverify
shopt -s extglob        # Necessary for programmable completion.

export TIMEFORMAT=$'\nreal %3R\tuser %3U\tsys %3S\tpcpu %P\n'
export HISTTIMEFORMAT="%H:%M > "
export HISTIGNORE="&:bg:fg:ll:h"
export HOSTFILE=$HOME/.hosts    # Put list of remote hosts in ~/.hosts ...

# Define some colors first:
red='\[\033[0;31m\]'
RED='\[\033[1;31m\]'
blue='\[\033[0;34m\]'
BLUE='\[\033[1;34m\]'
cyan='\[\033[0;36m\]'
CYAN='\[\033[1;36m\]'
NC='\[\033[0m\]'              # No Color
# --> Nice. Has the same effect as using "ansi.sys" in DOS.

# Some interactive aliases

alias rm='rm -i'
alias m=more
alias e='emacsclient -t'
alias ec='emacsclient'
export PS1="\[$(tput bold)$(tput setaf 4)\]\n[\u:\w] \[$(tput sgr0)\]"

export CDPATH=.:~:~/Dropbox:~/Dropbox/_support

# Looks best on a terminal with black background.....
echo -e "HAI! This is BASH ${BASH_VERSION%.*} - DISPLAY on $DISPLAY\n"
date

alias acroread='/Applications/Adobe\ Reader.app/Contents/MacOS/AdobeReader'

function aread () {
/Applications/Adobe\ Reader.app/Contents/MacOS/AdobeReader $* &
}

#-------------------
# Personal Aliases
#-------------------
# -> Prevents accidentally clobbering files.

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'

alias h='history'
alias j='jobs -l'
alias which='type -a'

alias kpseless='less $(kpsewhich $*)'
alias ..='cd ..'
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'
alias print='/usr/bin/lp -o nobanner -d $LPDEST'
            # Assumes LPDEST is defined (default printer)
alias pjet='enscript -h -G -fCourier9 -d $LPDEST'
            # Pretty-print using enscript

alias du='du -kh'       # Makes a more readable output.
alias df='df -kh'

#-------------------------------------------------------------
# The 'ls' family (this assumes you use a recent GNU ls)
#-------------------------------------------------------------
alias ls='ls -hF -G'  # add colors for filetype recognition
alias la='ls -Al'          # show hidden files
alias lx='ls -lXB'         # sort by extension
alias lk='ls -lSr'         # sort by size, biggest last
alias lc='ls -ltcr'        # sort by and show change time, most recent last
alias lu='ls -ltur'        # sort by and show access time, most recent last
alias lt='ls -ltr'         # sort by date, most recent last
alias lm='ls -al |more'    # pipe through 'more'
alias lr='ls -lR'          # recursive ls
alias tree='tree -Csu'     # nice alternative to 'recursive ls'
alias ec=emacsclient       # let the server run emacs 

# If your version of 'ls' doesn't support --group-directories-first try this:
 function ll(){ ls -l -G "$@"| egrep "^d" ; ls -lXB "$@" 2>&-| \
                egrep -v "^d|total "; }

#-------------------------------------------------------------
# tailoring 'less'
#-------------------------------------------------------------

alias more='less'
export PAGER=less
export EDITOR='emacsclient -t'
export LESSCHARSET='latin1'
export LESSOPEN='|/usr/bin/lesspipe.sh %s 2>&-'
   # Use this if lesspipe.sh exists
export LESS='-i -n -w  -z-4 -g -e -M -X -F -R -P%t?f%f \
:stdin .?pb%pb\%:?lbLine %lb:?bbByte %bb:-...'



#-------------------------------------------------------------
# A few fun ones
#-------------------------------------------------------------


function xtitle()      # Adds some text in the terminal frame.
{
    case "$TERM" in
        *term* | rxvt)
            echo -n -e "\033]0;$*\007" ;;
        *)
            ;;
    esac
}

# aliases that use xtitle
alias top='xtitle Processes on $HOST && top'
alias make='xtitle Making $(basename $PWD) ; make'
alias ncftp="xtitle ncFTP ; ncftp"

# .. and functions
function man()
{
    for i ; do
        xtitle The $(basename $1|tr -d .[:digit:]) manual
        command man -F -a "$i"
    done
}

function repeat () 
{ 
    n=$1;
    shift;
    while [ $(( n -= 1 )) -ge 0 ]; do
        "$@";
    done
}


## some TeX/LaTeX functions

function kless () 
{ 
    less `kpsewhich $1 || echo $1` 
}


### MacOSX 

function seeHiddenFiles ()
{
     defaults read com.apple.Finder AppleShowAllFiles YES
}


function hideHiddenFiles ()
{
     defaults read com.apple.Finder AppleShowAllFiles NO
}

# requires brew install git bash_completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export PS1='\n\[\033[1;32m\]\u@\h\[\033[0m\]\n\[\033[1;34m\][\W\[\033[1;34m\]$(__git_ps1 "\[\033[1;31m\]-(git:%s)")\[\033[1;34m\]\[\033[1;34m\]]\[\033[0m\] '



# COUCHDB

alias restart_couch='/usr/bin/sudo launchctl stop org.apache.couchdb'
alias start_couch='/usr/bin/sudo launchctl load -w /Library/LaunchDaemons/org.apache.couchdb.plist'
alias stop_couch='/usr/bin/sudo launchctl unload /Library/LaunchDaemons/org.apache.couchdb.plist'
