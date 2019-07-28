#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

config_dir_nvm=${1:-"${HOME}/.nvm"}

if [ -d "${config_dir_nvm}" ]; then
	echo "It seems nvm has already been configured."
	echo "Not gonna do anything."
	exit 0
fi

brew=$(which brew || true)
if [ -z "${brew}" ]; then
	echo "brew is not installed yet."
	echo "You probabbly want to run install-brews.sh before any configuration script."
	exit 1
fi

source $(brew --prefix nvm)/nvm.sh

# nvm is a bash function not an executable
exit_code=-1
{
	type nvm > /dev/null
	exit_code=$?
} || truet

if [ "${exit_code}" != "0" ]; then
	echo "nvm is not installed yet."
	echo "You probabbly want to run install-brews.sh before any configuration script."
	exit 1
fi

mkdir "${config_dir_nvm}"
result=$(nvm install "lts/dubnium")
result=$(nvm use default)

