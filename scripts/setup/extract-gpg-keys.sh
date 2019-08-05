#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

main() {
	check_tool "op"
	check_tool "jq"
	check_tool "gpg"

	eval $(op signin my)

	local temp_file=$(mktemp)

	extract_key "${temp_file}" "rethinc"
	local passphrase=$(extract_passphrase)
	import_key "${temp_file}" "${passphrase}"

	rm "${temp_file}"
}

extract_key() {
	local key_file="$1"
	local name="$2"
	op get document "gpg-keys - ${name}" > "${key_file}"
}

extract_passphrase() {
	op get item gpg-key-passphrase | jq -r .details.password
}

import_key() {
	local key_file="$1"
	local passphrase="$2"
	echo ${passphrase} | gpg --batch --yes --passphrase-fd 0 --import "${key_file}"
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