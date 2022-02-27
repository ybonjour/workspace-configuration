#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

main() {
	check_tool "mas"

	#Sign in is not supported sign in manually to the app store
	#signin

	# XCode
	mas install 497799835
	sudo xcodebuild -license

	# Markoff
	mas install 1084713122
}

signin() {
	username=$("${dir}/bitwarden-get-username.sh" yves-apple.com)
	password=$("${dir}/bitwarden-get-password.sh" yves-apple.com)

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