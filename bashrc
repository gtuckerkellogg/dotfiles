#!/usr/bin/env bash

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize


# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
        ;;
    *)
        ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -lF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix ; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

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
set -o noclobber # don't allow redirection to overwrite existing files
set -o ignoreeof # the shell will not exit on reading EOF
#set -o nounset  # treat unset variables as an error when using when substituting
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
red="$(tput sgr0)$(tput setaf 1)" #  red
green="$(tput sgr0)$(tput setaf 2)"
blue="$(tput sgr0)$(tput setaf 4)"
magenta="$(tput sgr0)$(tput setaf 5)"
white="$(tput sgr0)$(tput setaf 7)"
RED="$(tput bold)$(tput setaf 1)" #  bold red
GREEN="$(tput smso)$(tput setaf 2)"
GREEN='\[\033[1;32m\]'

BLUE="$(tput bold)$(tput setaf 4)"
WHITE="$(tput bold)$(tput setaf 7)"
MAGENTA="$(tput bold)$(tput setaf 5)"

# --> Nice. Has the same effect as using "ansi.sys" in DOS.

# Some interactive aliases

alias m=less
alias e='emacsclient -t'
alias ec='emacsclient'
export PS1="\[$(tput bold)$(tput setaf 4)\]\n[\u:\w] \[$(tput sgr0)\]"
alias mutt='cd ~/Desktop && mutt'

export CDPATH=.:~:~/Dropbox:~/Dropbox/_support

# Looks best on a terminal with black background.....
echo -e "HAI! This is BASH ${BASH_VERSION%.*} - DISPLAY on $DISPLAY\n"
date

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
alias ls='ls -hF --color=auto'  # add colors for filetype recognition
alias la='ls -Al'          # show hidden files
alias lx='ls -lXB'         # sort by extension
alias lk='ls -lSr'         # sort by size, biggest last
alias lc='ls -ltcr'        # sort by and show change time, most recent last
alias lu='ls -ltur'        # sort by and show access time, most recent last
alias ltr='ls -ltr'         # sort by date, most recent last
alias lt='ls -lt'         # sort by date, most recent first
alias lm='ls -al |more'    # pipe through 'more'
alias lr='ls -lR'          # recursive ls
alias tree='tree -Csu'     # nice alternative to 'recursive ls'
alias ec=emacsclient       # let the server run emacs 

# If your version of 'ls' doesn't support --group-directories-first try this:
function ll(){ ls -l -G "$@"| egrep "^d" ; ls -lXB "$@" 2>&-| \
    egrep -v "^d|total "; }

function kpseless () { less $(kpsewhich "$*"); }

#-------------------------------------------------------------
# tailoring 'less'
#-------------------------------------------------------------

alias more='less'
export PAGER=less
export EDITOR='emacsclient'
export LESSCHARSET='latin1'
export LESSOPEN='|/usr/bin/lesspipe.sh %s 2>&-'
# Use this if lesspipe.sh exists
export LESS='-i -n -w  -z-4 -g -e -M -X -R -P%t?f%f \
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
        command man -a "$i"
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


export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1

if [ -z "$INSIDE_EMACS" ] ; then 

    export PS1='\n\[\033[1;32m\]\u@\h\[\033[0m\]\n\[\033[1;34m\][\W\[\033[1;34m\]$(__git_ps1 "\[\033[1;31m\]-(git:%s)")\[\033[1;34m\]\[\033[1;34m\]]\[\033[0m\] '
fi


## ZOMBIES

function clear_zombies () {
    zombie_pids=$(ps h -A -ostat,pid | awk '!x[$0]++ && /^[Zz]/{ print $2 }' )
    if [[ -n "$zombie_pids" ]] ; then
	echo clearing $(echo $pids | wc -w) zombies
	kill -HUP $zombie_pids
    else
	echo no zombies
    fi
    
}


function zombie_parents () {
    zombie_ppids=$(ps h -A -ostat,pid | awk '!x[$0]++ && /^[Zz]/{ print $2 }' )    
    if [[ -n "$zombie_ppids" ]] ; then
	ps -p $zombie_ppids
    else
	echo no zombies
    fi

    }


export NO_AT_BRIDGE=1



# map

if [[ -f "${HOME}/.xcape-maps" ]] ; then
    source .xcape-maps
fi


# deduplicate path entries
PATH=$(printf %s "$PATH" | awk -v RS=: -v ORS=: '!arr[$0]++')


## set up snakemake completion if it is installed

if command -v snakemake %>//dev/null ; then
    $(snakemake --bash-completion)
fi





#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"



## vterm

if [[ "$INSIDE_EMACS" = 'vterm' ]] \
       && [[ -n ${EMACS_VTERM_PATH} ]] \
       && [[ -f ${EMACS_VTERM_PATH}/etc/emacs-vterm-bash.sh ]]; then

   vterm_printf() {
       if [ -n "$TMUX" ] && ([ "${TERM%%-*}" = "tmux" ] || [ "${TERM%%-*}" = "screen" ]); then
           # Tell tmux to pass the escape sequences through
           printf "\ePtmux;\e\e]%s\007\e\\" "$1"
       elif [ "${TERM%%-*}" = "screen" ]; then
           # GNU screen (screen, screen-256color, screen-256color-bce)
           printf "\eP\e]%s\007\e\\" "$1"
       else
           printf "\e]%s\e\\" "$1"

       fi

       	   

   }

   if [[ "$INSIDE_EMACS" = 'vterm' ]]; then
       function clear() {
           vterm_printf "51;Evterm-clear-scrollback";
           tput clear;
       }
       export PS1='\n\[\033[1;32m\]\u@\h\[\033[0m\]\n\[\033[1;34m\][\W\[\033[1;34m\]$(__git_ps1 "\[\033[1;31m\]-(git:%s)")\[\033[1;34m\]\[\033[1;34m\]]\[\033[0m\] '       
   fi

   PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND; }"'echo -ne "\033]0;${HOSTNAME}:${PWD}\007"'

   vterm_prompt_end(){
       vterm_printf "51;A$(whoami)@$(hostname):$(pwd)"
   }
   PS1=$PS1'\[$(vterm_prompt_end)\]'

fi
   

MANPATH=/usr/local/texlive/2023/texmf-dist/doc/man:${MANPATH}
INFOATH=/usr/local/texlive/2023/texmf-dist/doc/info:${INFOPATH}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
[ -d "$HOME/.rvm/bin" ]  && PATH="$PATH:$HOME/.rvm/bin"


man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}



hostname=$(hostname)
host_bashrc="${HOME}/src/dotfiles/hosts/${hostname}_rc"
if [ -f "${host_bashrc}" ] ; then
    source "${host_bashrc}"
fi


uname=$(uname)
uname_bashrc="${HOME}/src/dotfiles/hosts/${uname}_rc"
if [ -f "${uname_bashrc}" ] ; then
    source "${uname_bashrc}"
fi
