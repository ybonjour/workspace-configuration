#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

main() {
	check_tool "mas"
	check_tool "op"
	check_tool "jq"

 	# Signin is currently disabled by mas. See https://github.com/mas-cli/mas/issues/164
	# signin()

	# XCode
	mas install 497799835
	sudo xcodebuild -license

	# Markoff
	mas install 1084713122
}

sigin() {
	eval $(op signin my)

	username=$(op get item yves-apple.com | jq -r '.details.fields[] | select(.name == "username") | .value')
	password=$(op get item yves-apple.com | jq -r '.details.fields[] | select(.name == "password") | .value')

	mas signin "${username}" "${password}"
}

check_tool() {
	local name="${1:-}"
	local binary=$(which "${name}" || true)
	if [ -z "${binary:-}" ]; then
		(>&2 echo "${name} not found")
		(>&2 echo "You might want to run ./install=brews.sh before any configuration script.")
		exit 127
	fi
}

main