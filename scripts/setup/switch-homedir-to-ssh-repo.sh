#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
root="${dir}/../.."

main() {
	check_tool "git"
	local target_origin="git@github.com:ybonjour/workspace-configuration.git"
	local current_origin=$(git remote get-url origin || true)

	if [ "${current_origin:-}" == "${target_origin}" ]; then
		echo "Looks like the origin is already set to ${target_origin}."
		echo "Not gonna do anything"
		exit 0
	fi

	pushd ${dir}
		git remote remove origin || true
		git remote add origin "${target_origin}"
		git fetch --all
		git branch --set-upstream-to=origin/master master
		git pull
	popd
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