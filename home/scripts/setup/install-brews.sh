#!/usr/bin/env bash

# Mostly copied from https://github.com/scottmuc/osx-homedir/blob/master/bin/coalesce_this_machine

set -o errexit
set -o pipefail

dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

brew=$(which brew || true)

if [ -z "${brew}" ]; then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
brew update || true

brew bundle cleanup --file="~/Brewfile"
brew bundle --file="~/Brewfile"
