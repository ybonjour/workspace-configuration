#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

main() {
	check_tool "op"
	check_tool "jq"

	eval $(op signin my)

	local ssh_dir="${HOME}/.ssh"
	create_ssh_dir "${ssh_dir}"

	extract_key "${ssh_dir}" "id_rsa"
	extract_key "${ssh_dir}" "rethinc"
}

create_ssh_dir() {
	local ssh_dir="$1"
	mkdir -p "${ssh_dir}"
	chmod 700 "${ssh_dir}"
}

extract_key() {
	local ssh_dir="$1"
	local name="$2"
	local private_key="${ssh_dir}/${name}"
	local public_key="${ssh_dir}/${name}.pub"
	op get document "ssh-keys - ${name}" > "${private_key}"
	chmod 600 "${private_key}"
	op get document "ssh-keys - id_rsa.pub" > "${public_key}"
	chmod 644 "${public_key}"

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