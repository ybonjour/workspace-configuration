#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
root="${dir}/../.."

main() {
	check_tool "git"
	check_tool "ssh-add"

	local dev_folder="${HOME}/dev"
	mkdir -p "${dev_folder}"	
	mkdir -p "${dev_folder}/temp" # folder for temporary repos
	clone_all_repos "${root}/gitrepos" "${dev_folder}"
}


clone_all_repos() {
	local repo_file="$1"
	local dev_folder="$2"
	ssh-add ~/.ssh/github
	ssh-add ~/.ssh/bitbucket
	ssh-add ~/.ssh/azure
	pathAndRepos=$(cat "${repo_file}")
	echo "${pathAndRepos}" | while read pathAndRepo
	do
		tokens=($pathAndRepo)
		path="${tokens[0]}"
		repo="${tokens[1]}"
		repo_folder="${dev_folder}/${path}"

		if [ -d "${repo_folder}" ]; then
			echo "Not cloning ${repo} to ${repo_folder} since it already exists."
			continue
		fi
		git clone --recurse-submodules "${repo}" "${repo_folder}" || true
	done
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