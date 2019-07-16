Setup / What is needed?

* Repo: https://github.com/ybonjour/workspace-configuration (Needs cleanup)


* Install XCode Command line tools
	`xcode-select --install`
	Is there a way without user interaction?

* Install Brew
	in `/usr/local`: `mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew`

	`brew update` updates brew and formulas

	`brew cleanup` ? remove old versions from cellar

* Use Homebrew Cask for macOS GUI applications
	`brew tap caskroom/cask`

* Install mas (https://github.com/mas-cli/mas) for Mac App Store Installatins
** `brew install mas`


* Use Brew Bundle with a Brewfile to install bundles:
	https://github.com/Homebrew/homebrew-bundle


* Storing secrets:
** 1password: `brew cask install 1password`
** 1password CLI: `brew cask install 1password-cli`
** Signin in to 1password-cli `eval $(op signin my)`


* Rotate ssh keys
	** Create different keys for each account.
	** github (see https://github.com/scottmuc/osx-homedir/blob/master/bin/create-repave-secrets)
	** bitbucket
	** Google Cloud
	** Digital Ocean
	** AWS


* Programming Environments
	** Go
	** Java
	*** AdoptOpenJDK `brew tap adoptopenjdk/openjdk`, `brew cask install adoptopenjdk8`, `brew cask install adoptopenjdk11`
	** Node
	*** nvm: `brew install nvm`
	*** `mkdir ~/.nvm`
	*** Add to bash_profile ```
  		export NVM_DIR=~/.nvm
		source $(brew --prefix nvm)/nvm.sh
		```
	*** `nvm install --lts='Dubnium'`
	*** `nvm use default`
	** Python?
	** Ruby
	** git
	** XCode `mas install 497799835`


* Git Repositories auschecken
	** Keys?

* Web:
** Chrome: `brew cask install google-chrome`
*** plugins?


* Software:
** JetBrains Toolbox `brew cask install jetbrains-toolbox`
*** IntelliJ (manually, see https://youtrack.jetbrains.com/issue/TBX-653)
*** Android Studio (manually, see https://youtrack.jetbrains.com/issue/TBX-653)
** Better Touch Tool: `brew cask install bettertouchtool`
*** How to load configuration automatically?
** Scroll Reverser: `brew cask install scroll-reverser`
** Docker and Kubernetes: `brew cask install docker`, `brew install kubectl`, `brew cask install minikube`
** Slack: `brew cask install slack`
** Sublime: `brew cask install sublime-text`
** Snagit: `brew cask install snagit`
*** How to load license?
** Spotify: `brew cask install spotify`
** Postman: `brew cask install postman`
** Charles WebProxy: `brew cask install charles`
** Skype: `brew cask install skype`
** Kindle: `brew cask install kindle`
*** How to login automatically?
** Sonos: `brew cask install sonos`
** iTerm2 `brew cask install iterm2`
** Markoff (Use mas: `mas install 1084713122`)
** VLC `brew cask install vlc`


Command line:
** bat: `brew install bat`
** watch: `brew install watch`
** jq: `brew install jq`
** unrar: `brew install unrar`
** wget: `brew install wget`
** openssl: `brew install openssl`
** tree: `brew install tree`




