#!/usr/bin/env bash

# modified from [ivim](https://github.com/kepbod/ivim)

warn () {
  printf '\033[0;31m%s\033[0m\n' "$1" >&2
}

die () {
  warn "$1"
  exit 1
}

# check requirements
printf '\033[0;34m%s\033[0m\n' "Checking requirements for vim..."
printf '\033[0;34m%s\033[0m\n' "Checking vim version..."
vim --version | grep 7.4 || die "Your vim's version is too low!\nPlease download higher version(7.4+) from http://www.vim.org/download.php"
printf '\033[0;34m%s\033[0m\n' "Checking vim feature..."
vim --version | grep lua || die "Your build without lua feature!\nPlease compile vim with lua"
printf '\033[0;34m%s\033[0m\n' "Checking if git exists..."
which git || die "No git installed!\nPlease install git from http://git-scm.com/downloads/"
printf '\033[0;34m%s\033[0m\n' "Checking if lua exists..."
which git || die "No lua installed!\nPlease install lua from http://www.lua.org/"

# back up existing vim stuff
printf '\033[0;34m%s\033[0m\n' "Backing up current vim config..."
for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc; do
  [ -e $i ] && mv -f $i $i.backup;
done

# install
printf '\033[0;34m%s\033[0m\n' "Cloning repo..."
for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc; do
  [ -e $i ] && rm -rf $i
done
git clone --recursive --branch master https://github.com/bolasblack/.vim.git $HOME/.vim
ln -s $HOME/.vim/.vimrc $HOME/.vimrc

printf '\033[0;34m%s\033[0m\n' "Installing NeoBundle..."
mkdir -p $HOME/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/neobundle.vim

#printf '\033[0;34m%s\033[0m\n' "Installing font for powerline..."
#mkdir $HOME/.fonts
#wget -O $HOME/.fonts/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
#fc-cache -vf $HOME/.fonts
#mkdir $HOME/.fonts.conf.d
#wget -O $HOME/.fonts.conf.d/10-powerline-symbols.conf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf

printf '\033[0;34m%s\033[0m\n' "Installing plugins using NeoBundle..."
vim +'set nospell' +NeoBundleInstall!

printf '\033[0;34m%s\033[0m\n' "Config has been initialized. Just enjoy!"

