#!/usr/bin/env bash

set -o errexit
set -o pipefail

dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

nvm=$(which mas || true)

if [ -z "${mas}" ]; then
	echo "mas is not installed yet."
	echo "You probabbly want to run install-brews.sh before any configuration script."
	exit 1
fi

set -o nounset

# XCode
mas install 497799835

# Markoff
mas install 1084713122
