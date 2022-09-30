#!/bin/bash

print_error() {
  printf "\033[31m$1\033[0m\n"
}

print_green() {
  printf "\033[32m$1\033[0m\n"
}

path_scripts=$(echo $0 | sed "s|/config_install_non_root.sh||g ")
print_green "Running scripts in $path_scripts:"
for i in $path_scripts/non_root/*.sh; do
  if [ -r $i -a $i != "$0" ]; then
    print_green $i
    . $i
  fi
done
unset i
