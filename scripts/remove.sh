#!/usr/bin/env bash

echo "Do you want to remove vim config?"
echo -n "Type Y to restore: "
read line
if [ "$line" = Y ] || [ "$line" = y ]
then
    printf '\033[0;34m%s\033[0m\n' 'Removing vim config...'
    rm -rf $HOME/.vim/
    for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc; do
      [ -e $i ] && mv -f $i.backup $i;
    done
    printf '\033[0;34m%s\033[0m\n' "Vim config were removed."
fi

