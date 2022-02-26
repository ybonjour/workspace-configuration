#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

main() {
	"${dir}/bitwarden-get-note.sh" BetterTouchTool > ~/better-touch-tool-license
}

main