# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="garyblessington"
# jbergantine
# honukai
# garyblessington
# steeef
# frisk
# daveweaver
# norm

alias editzsh="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias reloadzsh=". ~/.zshrc"

alias ui="cd ~/Projects/ui_collaboration/"
alias mm="bundle exec middleman"
alias mmb="bundle exec middleman build"
alias mmbs="bundle exec middleman build && bundle exec middleman s3_sync"
alias cppath="pwd|pbcopy"
# alias git=hub
alias readlink=greadlink
alias dotfiles="homesick cd dotfiles"
alias tree="tree -C -A"
alias clean-build="npm run clean && npm run build"
alias rake='noglob rake'
alias gnuke="git branch | grep -v '^*' | xargs git branch -D"
alias nuw="nib up web"
alias nsw="nib setup web"
alias nb="nib build --pull"
alias npis="npm install --save"
alias npid="npm install --save-dev"
alias npig="npm install --global"
alias npi="npm install"
alias nbpm="npm run build && packAndMove"

function packAndMove() {
  DESTINATION=${1:=/Users/ben.dalton/Desktop}
  npm pack
  PACKAGE=$( find *.tgz )
  mv $PACKAGE $DESTINATION
  echo "yarn add $DESTINATION/$PACKAGE" | pbcopy
  echo "\"yarn add $DESTINATION/$PACKAGE\" copied to your clipboard"
}

# # print tree view of directory - optional argument of directory
# function tree() {
#   if [ ${1} ];then;
#     # show everything if specific
#     find $1 -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g';
#   else
#     # exclude these dirs
#     find . -path "**/node_modules/*" -o \
#            -path "**/.git/*" -o         \
#            -path "**/tmp/*"             \
#            -prune -o -print |           \
#            sed -e 's;[^/]*/;|____;g;s;____|; |;g';
#   fi
# }

# runs vim in a docker container
function edit() {
  WORKDIR=/workdir
  if [[ $# == 1  ]]; then
    FILENAME=$(basename $1)
    ABSFILE=$( cd $(dirname $1); pwd)/$FILENAME
    docker run -v $ABSFILE:$WORKDIR/$FILENAME -i -t vim:latest $WORKDIR/$FILENAME
  else
    echo "$0 expects exactly one file argument"
  fi
}

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
  cd /Users/ben.dalton/Projects/gordian/RSMeansProcurement/RSMPWebUI/RSMP.Web
  tab "cd '$PWD' && vim ."
  open -a "/Applications/Cisco/Cisco AnyConnect Secure Mobility Client.app"
  open -a "/Applications/Google Chrome.app" "http://localhost:8080"
  gulp webserver
}

# Start working on project Phoenix
function phxproto() {
  port=${1:="4567"}
  location="/Users/ben.dalton/Projects/gordian/RSM-UXUI"
  cd $location
  mmedit $port
}

function mmedit() {
  port=${1:="4567"}
  vsplit_tab "cd '$PWD' && vim ."
  open -a "/Applications/Google Chrome.app" "http://127.0.0.1:$port/__middleman/sitemap/"
  bundle exec middleman -p=$port
}

function build-emails() {
  bundle exec middleman build && find ./build/ -type f -exec sed -i '' -e 's/®/\&reg;/g ; s/©/\&copy;/g ; s/%20/ /g ; s/%7B/\{/g ; s/%7D/\}/g ; s/%7C\*/\|\*/g ; s/*%7C/\*\|/g ; s/™/\&trade;/g' {} \;
}

function replace_symbols() {
  find ./build/ -type f -exec sed -i '' -e 's/®/\&reg;/g ; s/©/\&copy;/g ; s/%20/ /g     ; s/%7B/\{/g ; s/%7D/\}/g ; s/%7C\*/\|\*/g ; s/*%7C/\*\|/g ; s/™/\&trade;/g' {} \;
}

export LC_CTYPE=C
export LANG=C

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
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(osx git bundler cp npm rake)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin


export PATH=$PATH:/Users/ben.dalton/android/platform-tools
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
# base16_eighties

fe() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

function dockercleancontainers() {
  if [[ -n "${1}" ]]; then
    docker rm $(docker ps -aq -f name="${1}")
  else
    # find exited containers that are not labeled “data” and remove them
    docker rm $(
    comm -13 \
      <(docker ps -aq -f status=exited -f label=data | sort) \
      <(docker ps -aq -f status=exited | sort)
    )
  fi
}

# eval "$(hub alias -s)"
export PATH="/usr/local/sbin:$PATH"
# eval $(dinghy shellinit)
# eval  export DOCKER_HOST=tcp://192.168.99.100:2376
#       export DOCKER_CERT_PATH=/Users/ben.dalton/.docker/machine/machines/dinghy
#
#       export DOCKER_TLS_VERIFY=1
#       export DOCKER_MACHINE_NAME=dinghy

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export NIB_CRYPT_BUCKET_NAME="tk-secrets"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/lib/ruby/gems/2.6.0/bin:$PATH"


# Renew MFA Authenticated awscli Credentials
# Assumptions:
#   - jq and awscli are installed
#   - a default profile already exists with valid TKXS AWS credentials (this is used to perform the request for mfa authenticated credentials)
#   - Username is hardcoded below and may need to be updated for the account you're authenticating with
#   - either an [mfa] profile doesn't exist yet or one with a key, secret, and session token defined exists. If a profile named [mfa] exists with fewer than 3 values defined below it and it is defined between two other profiles the lower profile will be damaged.
function awsotp() {
  if [ $# -ne 1 ]; then
    echo "Usage: awsotp TOTP-Code"
  else
    # Get new credentials
    credentials=$(aws sts get-session-token --serial-number arn:aws:iam::208979837966:mfa/ben.dalton@technekes.com --token-code "$1")
    # Make sure that worked
    if [ $? -ne 0 ]; then
      echo "There was an issue authenticating your request. Please try again with a new TOTP code or contact your administrator."
    else
      # Parse out new credentials
      aki="$(echo $credentials | jq -r '.Credentials.AccessKeyId')"
      aks="$(echo $credentials | jq -r '.Credentials.SecretAccessKey')"
      akt="$(echo $credentials | jq -r '.Credentials.SessionToken')"
      # Delete the old ones, if no profile named [mfa] exists this is still safe
      sed -ie '/\[mfa\]/,+3d' ~/.aws/credentials
      # Add the new credentials
      echo "[mfa]" >> ~/.aws/credentials
      echo "aws_access_key_id = ${aki}" >> ~/.aws/credentials
      echo "aws_secret_access_key= ${aks}" >> ~/.aws/credentials
      echo "aws_session_token = ${akt}" >> ~/.aws/credentials
      echo "Done. New credentials available under profile [mfa]."
    fi
  fi
}
