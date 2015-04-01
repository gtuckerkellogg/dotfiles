<<<<<<< HEAD
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

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

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
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
# my $HOME/.bashrc file
# Last modified Time-stamp: <2013-10-15 12:23:56 gtk>
#
# This file is read (normally) by interactive shells only.
# Here is the place to define your aliases, functions and
# other interactive features like your prompt.
#

>>>>>>> 8559a03f9381d4a9f1ff8d22c514b96c695f493b
# my $HOME/.bashrc file
# Last modified Time-stamp: <2013-10-15 12:23:56 gtk>
#
# This file is read (normally) by interactive shells only.
# Here is the place to define your aliases, functions and
# other interactive features like your prompt.
#

>>>>>>> 8559a03f9381d4a9f1ff8d22c514b96c695f493b
# my $HOME/.bashrc file
# Last modified Time-stamp: <2013-10-15 12:23:56 gtk>
#
# This file is read (normally) by interactive shells only.
# Here is the place to define your aliases, functions and
# other interactive features like your prompt.
#

>>>>>>> 8559a03f9381d4a9f1ff8d22c514b96c695f493b
# my $HOME/.bashrc file
# Last modified Time-stamp: <2013-10-15 12:23:56 gtk>
#
# This file is read (normally) by interactive shells only.
# Here is the place to define your aliases, functions and
# other interactive features like your prompt.
#

>>>>>>> 8559a03f9381d4a9f1ff8d22c514b96c695f493b
# my $HOME/.bashrc file
# Last modified Time-stamp: <2013-10-15 12:23:56 gtk>
#
# This file is read (normally) by interactive shells only.
# Here is the place to define your aliases, functions and
# other interactive features like your prompt.
#

>>>>>>> 8559a03f9381d4a9f1ff8d22c514b96c695f493b
# my $HOME/.bashrc file
# Last modified Time-stamp: <2013-10-15 12:23:56 gtk>
#
# This file is read (normally) by interactive shells only.
# Here is the place to define your aliases, functions and
# other interactive features like your prompt.
#

>>>>>>> 8559a03f9381d4a9f1ff8d22c514b96c695f493b
# my $HOME/.bashrc file
# Last modified Time-stamp: <2013-10-15 12:23:56 gtk>
#
# This file is read (normally) by interactive shells only.
# Here is the place to define your aliases, functions and
# other interactive features like your prompt.
#

>>>>>>> 8559a03f9381d4a9f1ff8d22c514b96c695f493b
# my $HOME/.bashrc file
# Last modified Time-stamp: <2013-10-15 12:23:56 gtk>
#
# This file is read (normally) by interactive shells only.
# Here is the place to define your aliases, functions and
# other interactive features like your prompt.
#

>>>>>>> 8559a03f9381d4a9f1ff8d22c514b96c695f493b
# my $HOME/.bashrc file
# Last modified Time-stamp: <2013-10-15 12:23:56 gtk>
#
# This file is read (normally) by interactive shells only.
# Here is the place to define your aliases, functions and
# other interactive features like your prompt.
#

>>>>>>> 8559a03f9381d4a9f1ff8d22c514b96c695f493b
# my $HOME/.bashrc file
# Last modified Time-stamp: <2013-10-15 12:23:56 gtk>
#
# This file is read (normally) by interactive shells only.
# Here is the place to define your aliases, functions and
# other interactive features like your prompt.
#

>>>>>>> 8559a03f9381d4a9f1ff8d22c514b96c695f493b
# my $HOME/.bashrc file
# Last modified Time-stamp: <2013-10-15 12:23:56 gtk>
#
# This file is read (normally) by interactive shells only.
# Here is the place to define your aliases, functions and
# other interactive features like your prompt.
#

>>>>>>> 8559a03f9381d4a9f1ff8d22c514b96c695f493b
# my $HOME/.bashrc file
# Last modified Time-stamp: <2013-10-15 12:23:56 gtk>
#
# This file is read (normally) by interactive shells only.
# Here is the place to define your aliases, functions and
# other interactive features like your prompt.
#

>>>>>>> 8559a03f9381d4a9f1ff8d22c514b96c695f493b
# my $HOME/.bashrc file
# Last modified Time-stamp: <2013-10-15 12:23:56 gtk>
#
# This file is read (normally) by interactive shells only.
# Here is the place to define your aliases, functions and
# other interactive features like your prompt.
#

>>>>>>> 8559a03f9381d4a9f1ff8d22c514b96c695f493b
fi
# my $HOME/.bashrc file
# Last modified Time-stamp: <2013-10-15 12:23:56 gtk>
#
# This file is read (normally) by interactive shells only.
# Here is the place to define your aliases, functions and
# other interactive features like your prompt.
#

>>>>>>> 8559a03f9381d4a9f1ff8d22c514b96c695f493b
# my $HOME/.bashrc file
# Last modified Time-stamp: <2013-10-15 12:23:56 gtk>
#
# This file is read (normally) by interactive shells only.
# Here is the place to define your aliases, functions and
# other interactive features like your prompt.
#

>>>>>>> 8559a03f9381d4a9f1ff8d22c514b96c695f493b
# my $HOME/.bashrc file
# Last modified Time-stamp: <2013-10-15 12:23:56 gtk>
#
# This file is read (normally) by interactive shells only.
# Here is the place to define your aliases, functions and
# other interactive features like your prompt.
#

>>>>>>> 8559a03f9381d4a9f1ff8d22c514b96c695f493b
# my $HOME/.bashrc file
# Last modified Time-stamp: <2013-10-15 12:23:56 gtk>
#
# This file is read (normally) by interactive shells only.
# Here is the place to define your aliases, functions and
# other interactive features like your prompt.
#

>>>>>>> 8559a03f9381d4a9f1ff8d22c514b96c695f493b
fi
=======
#  -*- sh -*- 

>>>>>>> 8559a03f9381d4a9f1ff8d22c514b96c695f493b
# my $HOME/.bashrc file
# Last modified Time-stamp: <2013-10-15 12:23:56 gtk>
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
red="$(tput sgr0)$(tput setaf 1)" #  red
green="$(tput sgr0)$(tput setaf 2)"
blue="$(tput sgr0)$(tput setaf 4)"
white="$(tput sgr0)$(tput setaf 7)"
RED="$(tput bold)$(tput setaf 1)" #  bold red
GREEN="$(tput bold)$(tput setaf 2)"
BLUE="$(tput bold)$(tput setaf 4)"
WHITE="$(tput bold)$(tput setaf 7)"

# --> Nice. Has the same effect as using "ansi.sys" in DOS.

# Some interactive aliases

alias rm='rm -i'
alias m=more
alias e='emacsclient -t'
alias ec='emacsclient'
export PS1="\[$(tput bold)$(tput setaf 4)\]\n[\u:\w] \[$(tput sgr0)\]"
alias mutt='cd ~/Desktop && mutt'

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
alias ls='ls -hF '  # add colors for filetype recognition
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


## some TeX/LaTeX functions

function kless () 
{ 
    less `kpsewhich $1 || echo $1` 
}


function compile-ssh-config() {
    cat <<EOF  >|  ~/.ssh/config
# --* This file is automatically generated and overwritten by login  *--
# --* Put configuration into a file in ~/.ssh/config.d instead. *--
EOF
    for file in ~/.ssh/config.d/*; do
printf "\n# --- $file ---\n" >> ~/.ssh/config
        cat $file >> ~/.ssh/config
    done
}

if hash ssh  2>&-  && [ -d ~/.ssh/config.d  ] ; then
    compile-ssh-config
fi

### MacOSX 

if [ $(uname) = "Darwin" ] ; then 

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
elif [ -d $(brew --prefix)/etc/bash_completion.d ] ; then
    . `brew --prefix`/etc/bash_completion.d/git-prompt.sh
    . `brew --prefix`/etc/bash_completion.d/git-completion.bash
fi
    


fi

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1

if [ -z "$INSIDE_EMACS" ] ; then 

    export PS1='\n\[\033[1;32m\]\u@\h\[\033[0m\]\n\[\033[1;34m\][\W\[\033[1;34m\]$(__git_ps1 "\[\033[1;31m\]-(git:%s)")\[\033[1;34m\]\[\033[1;34m\]]\[\033[0m\] '
#    export PS1="\n\${GREEN}\u@\h\n${BLUE}[\W$(__git_ps1 '-(git:%s)')]${WHITE} "
else
    export PS1='\h:\W \u\$ '
fi



# COUCHDB, probably needs fixing

alias restart_couch='/usr/bin/sudo launchctl stop org.apache.couchdb'
alias start_couch='/usr/bin/sudo launchctl load -w /Library/LaunchDaemons/org.apache.couchdb.plist'
alias stop_couch='/usr/bin/sudo launchctl unload /Library/LaunchDaemons/org.apache.couchdb.plist'


function ever() { 
    cp $@ ~/Desktop/toEvernote
}

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
