#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

main() {
	check_tool "bw"
	check_tool "jq"

	local output_directory=${1:-}
	if [ -z "${output_directory}" ]; then
		echo "USAGE: ${0} <output directory>"
		exit 1
	fi

	bw login --check --quiet || bw login
	
	local session=${BW_SESSION:-}
	if [ -z "${session}" ]; then
		session=$(bw unlock --raw)
	fi

	bw sync

	local ssh_key_folder=$(bw get folder ssh-keys --session=${session} | jq --raw-output .id)


	# ssh key items as a list of {name}\t{id}
	local ssh_key_items=$(bw list items --folderid ${ssh_key_folder} --session=${session} | jq --raw-output '.[] | "\(.name);\(.id)"')

	for line in ${ssh_key_items}; do
		local tokens=(${line//;/ })
		local name=${tokens[0]}
		local id=${tokens[1]}
		local path="${output_directory}/${name}"
		if [ -e "${path}" ]; then
			echo "Ignore ${name} as it already exists in ${path}"
		else
			echo "Writing key ${path}"
			bw get item "${id}" | jq --raw-output .notes > "${path}"
			if [[ "${path}" != *".pub" ]]; then
				chmod 600 "${path}"
			else
				chmod 644 "${path}"
			fi
		fi
	done

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
