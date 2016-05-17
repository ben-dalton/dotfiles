# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias reloadzsh=". ~/.zshrc"

alias ui="cd ~/Projects/ui_collaboration/"
alias mm="bundle exec middleman"
alias mmb="bundle exec middleman build"
alias mmbs="bundle exec middleman build && bundle exec middleman s3_sync"

function buildOneEmail() { 
	bundle exec middleman build --glob \"${1}\" --no-clean
	echo Done building...
	echo Replacing symbols...
	replace_symbols
	echo Done.
}

function addS3Creds() { 
	ln -s ~/.s3_sync .s3_sync
}

# Phoenix production ui
function phxprod() { 
	cd /Users/bendalton/Projects/gordian/RSMeansProcurement/RSMPWebUI/RSMP.Web
	vim_new_tab
	open -a "/Applications/Cisco/Cisco AnyConnect Secure Mobility Client.app"
	open -a "/Applications/Google Chrome.app" "http://localhost:8080"
	gulp webserver
}

# Start working on project Phoenix
function phxproto() {
  port=${1:="4567"}
	location="/Users/bendalton/Projects/gordian/RSM-UXUI"
	cd $location
	mmedit $port
}

function mmedit() {
	port=${1:="4567"}
	vim_new_tab
	open -a "/Applications/Google Chrome.app" "http://127.0.0.1:$port/__middleman/sitemap/"
	bundle exec middleman -p=$port
}

function vim_new_tab() { 
	osascript -e 'tell application "iTerm" to activate' \
		-e 'tell application "System Events" to tell process "iTerm" to keystroke "t" using command down' \
		-e 'tell application "iTerm" to tell session -1 of current terminal to write text "cd '$PWD' && vim ."'
}

function build-emails() {
  bundle exec middleman build && find ./build/ -type f -exec sed -i '' -e 's/®/\&reg;/g ; s/©/\&copy;/g ; s/%20/ /g ; s/%7B/\{/g ; s/%7D/\}/g ; s/%7C\*/\|\*/g ; s/*%7C/\*\|/g ; s/™/\&trade;/g' {} \;
}

function replace_symbols() {
  find ./build/ -type f -exec sed -i '' -e 's/®/\&reg;/g ; s/©/\&copy;/g ; s/%20/ /g     ; s/%7B/\{/g ; s/%7D/\}/g ; s/%7C\*/\|\*/g ; s/*%7C/\*\|/g ; s/™/\&trade;/g' {} \;
}

export LC_CTYPE=C
export LANG=C

alias nib='
 docker run \
	-it \
	--rm \
	-v $(pwd):$(pwd) \
	-w $(pwd) \
	-v $HOME/.docker/config.json:/root/.docker/config.json:ro \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-e "DOCKER_HOST_URL=$DOCKER_HOST" \
		 technekes/nib'

# for devbox
export DEV_BOX=$HOME/Projects/devbox

alias vup="cd $DEV_BOX;vagrant up --provision;"
alias vhalt="cd $DEV_BOX; vagrant halt;"
alias vssh="cd $DEV_BOX; vagrant ssh;"
alias apps="cd $DEV_BOX/apps"
alias gems="cd $DEV_BOX/gems"

alias reactsimplestarter="cd /Users/bendalton/Projects/udemy/react-redux/ReduxSimpleStarter"

function run_command_on_devbox() {
  ssh -p 2222 -i ~/.vagrant.d/insecure_private_key vagrant@localhost "source ~/.bash_profile; $1"
}

function restart_app() {
  run_command_on_devbox "restart_app $1"
}

function bundle_app() {
  run_command_on_devbox "cd /var/apps/$1_app; bundle; restart_app $1"
}

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin


export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export PATH=$PATH:/Users/bendalton/android/platform-tools
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

eval $(dinghy shellinit)
