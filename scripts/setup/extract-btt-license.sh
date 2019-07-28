#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

main() {
	check_tool "op"
	check_tool "jq"

	eval $(op signin my)

	op get item BetterTouchTool | jq -r '.details.sections[] | select(.fields) | .fields[] | select(.t == "license key") | .v' > ~/better-touch-tool-license	
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