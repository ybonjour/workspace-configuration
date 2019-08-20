#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)


main() {
	check_tool "pass"
	local gpg_id="31E5951D7A0E2D155C501F16C3DCB108A821E5BB"
	pass init "${gpg_id}"
	pass git init
	pass git remote add origin git@bitbucket.org:re-thinc/pass.git
	pass git branch --set-upstream-to=origin/master
	pass git pull --rebase origin master
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
