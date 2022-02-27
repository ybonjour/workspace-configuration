#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

main() {
	local pkg_file="/tmp/express-vpn.pkg"
	curl -sSL https://www.expressvpn.com/clients/latest/mac -o "${pkg_file}"
	trap "rm -f ${pkg_file}" EXIT
	sudo installer -pkg "${pkg_file}" -target /
}

main "$@"