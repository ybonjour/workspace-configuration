#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

# Mostly copied from https://github.com/scottmuc/osx-homedir/blob/master/bin/initialize-1password

dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
main() {
  exit_if_initialized
  op signin my.1password.eu yves.bonjour@gmail.com
}

exit_if_initialized() {
  if [[ -f ~/.op/config ]]
  then
    echo "Looks like 1password-cli has been initialized already"
    exit 0
  fi
}

main "@$"
