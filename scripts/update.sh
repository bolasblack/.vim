#!/usr/bin/env bash

if git --git-dir=$HOME/.vim/.git pull --rebase origin master; then
  printf '\033[0;34m%s\033[0m\n' 'Vim config has been updated and/or is at the current version.'
else
  printf '\033[0;31m%s\033[0m\n' 'There was an error updating. Try again later?'
fi

