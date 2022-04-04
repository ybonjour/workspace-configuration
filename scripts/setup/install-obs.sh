#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

main() {
	installDmg "https://cdn-fastly.obsproject.com/downloads/obs-mac-27.2.2.dmg" "OBS-Studio 27.2.2"
}

function installDmg() {
	local url="${1}"
	local image="${2}"
	local dmg_file="/tmp/${image}.dmg"
	curl -sSL "${url}" -o "${dmg_file}"
	trap "rm -f ${dmg_file}" EXIT
	sudo hdiutil attach "${dmg_file}"
	trap "sudo hdiutil detach \"/Volumes/${image}\"" EXIT
	sudo cp -r /Volumes/"${image}"/*.app /Applications
}

main "$@"