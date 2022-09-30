#!/bin/bash

print_error() {
  printf "\033[31m$1\033[0m\n"
}

print_green() {
  printf "\033[32m$1\033[0m\n"
}

test_env() {
  if [ -z "$1" ]; then
    print_error "undefined $2 in:"
    print_error ".env file for docker-compose.yml"
    print_error "or"
    print_error "docker build --build-arg $2=a_value "
    exit 1
  fi
}

test_env "$USERNAME" "USERNAME"
test_env "$USER_UID" "USER_UID"
test_env "$USER_GID" "USER_GID"
test_env "$PASSWD" "PASSWD"
test_env "$DOCKER_GID" "DOCKER_GID"

path_scripts=$(echo $0 | sed "s|/config_install_root.sh||g ")
print_green "Running scripts in $path_scripts:"
for i in $path_scripts/root/*.sh; do
  if [ -r $i -a $i != "$0" ]; then
    print_green $i
    . $i
  fi
done
unset i
