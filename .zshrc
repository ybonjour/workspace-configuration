# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="/Users/yvbo/.oh-my-zsh"
ZSH_THEME="powerlevel9k/powerlevel9k"

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root line)

source $ZSH/oh-my-zsh.sh

source ~/.aliases
source ~/.npm-completion
source ~/.android-profile

DEFAULT_JAVA_VERSION=1.8
DEV_ROOT=~/dev
HOME_BIN=~/scripts/bin
export JAVA_HOME="$(/usr/libexec/java_home -v ${DEFAULT_JAVA_VERSION})"
export ANDROID_SDK_ROOT=~/Library/Android/sdk
export ANDROID_HOME=~/Library/Android/sdk
export GOPATH="${DEV_ROOT}/go"
export PATH=$HOME_BIN:/usr/local/anaconda3/bin:$PATH
export CONNECT_CONFIG="~/.connect"
export ZSH="${HOME}/.oh-my-zsh"
export NVM_DIR="${HOME}/.nvm"
source $(brew --prefix nvm)/nvm.sh
source $(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc
source $(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc