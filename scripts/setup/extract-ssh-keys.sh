#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

main() {
	local ssh_dir="${HOME}/.ssh"
	create_ssh_dir "${ssh_dir}"

	"${dir}/write-ssh-keys-from-bitwarden.sh" "${ssh_dir}"
}

create_ssh_dir() {
	local ssh_dir="$1"
	mkdir -p "${ssh_dir}"
	chmod 700 "${ssh_dir}"
}

main