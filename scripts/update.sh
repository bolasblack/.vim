#!/usr/bin/env bash

cd ~/.vim
git fetch && git checkout origin/master

if [ $? -eq 0 ]; then
  printf '\033[0;34m%s\033[0m\n' 'Vim config has been updated and/or is at the current version.'
else
  printf '\033[0;31m%s\033[0m\n' 'There was an error updating. Try again later?'
fi

