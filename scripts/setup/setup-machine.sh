#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
root="${dir}/../.."

(xcode-select --install || true) # avoid error if already installed
source ${root}/.bash_profile

"${dir}"/install-brews.sh
"${dir}"/initialize-1password.sh
"${dir}"/install-mas.sh
"${dir}"/install-condas.sh
"${dir}"/node-nvm-setup.sh
"${dir}"/extract-btt-license.sh
"${dir}"/extract-ssh-keys.sh
"${dir}"/customize-dock.sh
"${dir}"/initialize-gitrepos.sh
"${dir}"/switch-homedir-to-ssh-repo.sh
"${dir}"/run-osx-softwareupdates.sh
"${dir}"/install-oh-my-zsh.sh