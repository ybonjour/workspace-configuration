# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="/Users/yvbo/.oh-my-zsh"

source "$(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme" 

source $ZSH/oh-my-zsh.sh

source ~/.aliases
source ~/.npm-completion
source ~/.android-profile

DEFAULT_JAVA_VERSION=11
DEV_ROOT=~/dev
HOME_BIN=~/scripts/bin
export JAVA_HOME="$(/usr/libexec/java_home -v ${DEFAULT_JAVA_VERSION})"
export ANDROID_SDK_ROOT=~/Library/Android/sdk
export ANDROID_HOME=~/Library/Android/sdk
export GOPATH="${DEV_ROOT}/go"
export PATH=$HOME_BIN:/usr/local/anaconda3/bin:/opt/homebrew/bin:$PATH
export CONNECT_CONFIG="~/.connect"
export ZSH="${HOME}/.oh-my-zsh"
export NVM_DIR="${HOME}/.nvm"
source $(brew --prefix nvm)/nvm.sh
source $(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc
source $(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
