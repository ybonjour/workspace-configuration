source ~/.aliases

DEFAULT_JAVA_VERSION=1.7
DEV_ROOT=~/dev

parse_hg_branch(){
	hg branch 2> /dev/null | sed -e 's/\(.*\)/ (\1)/'
}

parse_git_branch(){
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)$(parse_hg_branch)\[\033[00m\] $ "
export JAVA_HOME="$(/usr/libexec/java_home -v ${DEFAULT_JAVA_VERSION})"
export GOPATH="${DEV_ROOT}/go"
