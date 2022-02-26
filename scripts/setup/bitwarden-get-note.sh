#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

main() {
	check_tool "bw"
	check_tool "jq"

	local name=${1:-}
	if [ -z "${name}" ]; then
		echo "USAGE: ${0} <name>"
		exit
	fi

	bw login --check --quiet || bw login
	
	local session=${BW_SESSION:-}
	if [ -z "${session}" ]; then
		session=$(bw unlock --raw)
	fi

	bw sync > /dev/null

	bw get notes "${name}"  --session=${session}
}

check_tool() {
	local name="${1:-}"
	local binary=$(which "${name}" || true)
	if [ -z "${binary:-}" ]; then
		(>&2 echo "${name} not found")
		(>&2 echo "You might want to run ./install-brews.sh before any configuration script.")
		exit 127
	fi
}

main "$@"
