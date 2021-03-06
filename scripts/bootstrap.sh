#!/usr/bin/env bash

# modified from [ivim](https://github.com/kepbod/ivim)

warn () {
  printf '\032[0;31m%s\033[0m\n' "$1" >&2
}

die () {
  warn "$1"
  exit 1
}

is-version-greater-than() {
  requiredVer="$1"
  checkingVer="$2"

  printf '%s\n%s\n' "$requiredVer" "$checkingVer" | sort --check=quiet --version-sort
}

# check requirements
printf '\033[0;34m%s\033[0m\n' "Checking requirements for vim..."
printf '\033[0;34m%s\033[0m\n' "Checking if git exists..."
which git || die "No git installed!\nPlease install git from http://git-scm.com/downloads/"
printf '\033[0;34m%s\033[0m\n' "Checking vim version..."
vimVer="$(vim --version | head -n1 | cut -d' ' -f5)"
is-version-greater-than '7.4' "$vimVer" || "Your vim's version is too low!\nPlease download higher version(7.4+) from http://www.vim.org/download.php"
printf '\033[0;34m%s\033[0m\n' "Checking vim feature..."
vim --version | grep +lua || die "Your build without lua feature!\nPlease compile vim with lua"

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

if [ `uname` = 'Darwin' ]; then
  printf '\033[0;31m%s\033[0m\n' "Download patched powerline font file from: https://github.com/Lokaltog/powerline-fonts..."
else
  printf '\033[0;34m%s\033[0m\n' "Installing font for powerline..."
  mkdir $HOME/.fonts
  wget -O $HOME/.fonts/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
  fc-cache -vf $HOME/.fonts
  mkdir $HOME/.fonts.conf.d
  wget -O $HOME/.fonts.conf.d/10-powerline-symbols.conf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
fi

printf '\033[0;34m%s\033[0m\n' "Installing plugins..."
vim -es -u $HOME/.vim/vimrc -i NONE -c "PlugInstall" -c "qa"

printf '\033[0;34m%s\033[0m\n' "Config has been initialized. Just enjoy!"

