# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# ZSH_THEME="intheloop"
# ZSH_THEME="norm"
# ZSH_THEME="half-life"
# ZSH_THEME="lambda"
# ZSH_THEME="miloshadzic"
ZSH_THEME="ben"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 15

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=~/.config/oh-my-zsh/

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git fig nvm node macos emoji vi-mode)

source $ZSH/oh-my-zsh.sh

# User configuration

# Autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
export PATH="${PATH}:${HOME}/Library/Python/3.10/bin/"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Functions
# Pack up an npm package and set it by the front door
function packAndMove() {
  DESTINATION=${1:=~/ben.dalton/Desktop}
  npm pack
  PACKAGE=$( find *.tgz )
  mv $PACKAGE $DESTINATION
  echo "yarn add $DESTINATION/$PACKAGE" | pbcopy
  echo "\"yarn add $DESTINATION/$PACKAGE\" copied to your clipboard"
}

# Clean up Docker Containers
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

# pretend "curl cheat.sh" is a cli
function cheat() {
  if [[ -n "${2}" ]]; then
    QUERY="/${2//\ /+}"
    echo cheat.sh/${1}$QUERY
    curl cheat.sh/${1}$QUERY
  else
    curl cheat.sh/${1}
  fi
}

# Enable vi mode
bindkey -v
VI_MODE_SET_CURSOR=true

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Aliases
alias ezsh="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias szsh="source ~/.zshrc"
alias vim="nvim"
alias cppath="pwd|pbcopy"
alias cleanbuild="npm run clean && npm run build"
alias rake='noglob rake'
alias gnuke="git branch | grep -v '^*' | xargs git branch -D"
alias glg="git lg"
alias nuw="nib up web"
alias nsw="nib setup web"
alias nb="nib build --pull"
alias npis="npm install --save"
alias npid="npm install --save-dev"
alias npig="npm install --global"
alias npi="npm install"
alias nbpm="npm run build && packAndMove"
alias yd="yarn dev"
alias unobsessed="rm *obsession*"
alias clearvimsession="rm Session.vim"
alias notes="cd ~/Projects/zettelkasten/"
alias weather="curl -s 'wttr.in/charlotte\?u'"
alias weather:today="curl -s v2d.wttr.in/charlotte\?u"
alias ytmd="~/.config/scripts/ytmd_commands.sh"
alias mux="tmuxinator"
alias etmux="cd ~/.config/tmux && vim ."
alias envim="cd ~/.config/nvim && vim ."

# Roofstock Aliases
alias rscli="cd ~/RoofstockGits/roofstock.cli && local-ssl-proxy --config local-https-proxy.json"
alias rswebapp="cd ~/RoofstockGits/retail-web-app/src/Roofstock.Web.NextApp && yarn dev"
alias rsgis="cd ~/RoofstockGits/gis-app/Roofstock.GisApp.NextApp && yarn dev"
alias gis="cd ~/RoofstockGits/gis-app"
alias gisdev="~/.config/scripts/gis-app.sh"

function gitup() {
  BRANCH=$(git branch --show-current)
  git branch --set-upstream-to=origin/$BRANCH $BRANCH
}

eval "$(rbenv init - zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export NVM_DIR="$HOME/.nvm"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Python
export LDFLAGS="-L$(brew --prefix gettext)/lib -L$(brew --prefix zlib)/lib -L$(brew --prefix openssl)/lib  -L$(brew --prefix readline)/lib"
export CPPFLAGS="-I$(brew --prefix gettext)/include -I$(brew --prefix zlib)/include -I$(brew --prefix openssl)/include -I$(brew --prefix readline)/include"

# pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# use config to handle git actions for dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"


