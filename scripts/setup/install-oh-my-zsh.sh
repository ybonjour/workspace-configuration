#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)


curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash || true
git clone https://github.com/bhilburn/powerlevel9k.git "${HOME}/.oh-my-zsh/custom/themes/powerlevel9k" || true
git clone https://github.com/zsh-users/zsh-autosuggestions "${HOME}/.oh-my-zsh/custom/plugins/zsh-autosuggestions" || true
chsh -s /bin/zsh

# Oh My ZSH overrides .zshrc. We need to revert this
pushd "${HOME}"
	git checkout -- .zshrc
popd