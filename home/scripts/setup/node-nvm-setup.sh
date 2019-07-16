#!/usr/bin/env bash

set -o errexit
set -o pipefail

dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

nvm_config_dir=${1:~/.nvm}
nvm=$(which nvm || true)

if [ -d "${nvm_config_dir}" ]; then
	echo "It seems nvm has already been configured."
	echo "Not gonna do anything."
	exit 0
fi

if [ -z "${nvm}" ]; then
	echo "nvm is not installed yet."
	echo "You probabbly want to run install-brews.sh before any configuration script."
	exit 1
fi

set -o nounset

mkdir ~/.nvm
source ~/.bash_profile # ensure we got newest .bash_profile for nvm configuration
nvm install --lts='Dubnium'
nvm use default
