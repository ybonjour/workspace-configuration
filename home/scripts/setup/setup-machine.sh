#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

./install-brews.sh
./install-mas.sh
./node-nvm-setup.sh
./run-osx-softwareupdates.sh
