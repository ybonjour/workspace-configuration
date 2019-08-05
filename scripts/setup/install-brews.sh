#!/usr/bin/env bash

# Mostly copied from https://github.com/scottmuc/osx-homedir/blob/master/bin/coalesce_this_machine

set -o errexit
set -o pipefail

dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

brew=$(which brew || true)

if [ -z "${brew}" ]; then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

no_update="${1:-}"

if [ "${no_update}" != "no-update" ]; then
	echo "Updating brews"
	brew update || true
	brew bundle cleanup --file="${HOME}/Brewfile" --force	
fi


brew bundle --file="${HOME}/Brewfile"
