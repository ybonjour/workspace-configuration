#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

# Mostly copied from https://github.com/scottmuc/osx-homedir/blob/master/bin/curl-bash-bootstrap.bash

dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
target_dir=${1:-~}

if [ ! -d ${target_dir} ]; then
	(>&2 echo "${target_dir} does not exist.")
	(>&2 echo "Not gonna do anything.")
	exit 1
fi

pushd ${target_dir}
	if [ -d .git ]; then
		(>&2 echo "${target_dir} is already a git repository. It seems you have already bootstrapped this machine.")
		(>&2 echo "Not gonna do anything.")
		exit 1
	fi
	git init
	git remote add origin https://github.com/ybonjour/workspace-configuration.git
	git fetch --all
	git checkout master
popd

echo "You are now ready to run: ${target_dir}/scripts/setup/setup-machine.sh"