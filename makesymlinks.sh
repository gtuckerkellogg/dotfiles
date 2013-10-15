#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in 
############################

########## Variables


SOURCEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#SOURCEDIR=$(dirname $SOURCEDIR)
PROGNAME=$(basename ${BASH_SOURCE[0]})
olddir=~/dotfiles_old             # old dotfiles backup directory
files="bashrc bash_profile"    # list of files/folders to symlink in homedir


##########

## Color settings
# Define some colors first:
red="$(tput sgr0)$(tput setaf 1)" #  red
green="$(tput sgr0)$(tput setaf 2)"
blue="$(tput sgr0)$(tput setaf 4)"
white="$(tput sgr0)$(tput setaf 7)"
RED="$(tput bold)$(tput setaf 1)" #  bold red
GREEN="$(tput bold)$(tput setaf 2)"
BLUE="$(tput bold)$(tput setaf 4)"
WHITE="$(tput bold)$(tput setaf 7)"


# create dotfiles_old in homedir
echo "${WHITE}------------------------------"
echo "${PROGNAME} to symlink dotfiles ~ from ${SOURCEDIR}"
echo "${WHITE}------------------------------"


echo -n "${RED}Creating $olddir for backup of any existing dotfiles in ~ ..."
echo "${WHITE}done"

mkdir -p $olddir


# change to the dotfiles directory
echo -n "${BLUE}Changing to the ${SOURCEDIR} directory ..."
cd $SOURCEDIR
echo "done${WHITE}"

echo $files

echo "${BLUE}Moving any existing dotfiles from ~ to $olddir"

for file in $files; do
    mv ~/.$file ~/dotfiles_old/
    echo "${RED}Creating symlink to $file in home directory."
    ln -s ${SOURCEDIR}/${file} ~/.${file}
done
