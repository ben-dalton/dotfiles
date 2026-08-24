# Kiro CLI pre block. Keep at the top of this file.
# [[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh"
# # Amazon Q pre block. Keep at the top of this file.
# # If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

[[ -f "$HOME/projects/cloudzero/frontend-mono-repo/.env.yarn" ]] && builtin source "$HOME/projects/cloudzero/frontend-mono-repo/.env.yarn" 

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
# zstyle ':omz:update' mode auto      # update automatically without asking
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
plugins=(git nvm node macos emoji vi-mode)

source $ZSH/oh-my-zsh.sh
[[ -f "$HOME/.zshenv" ]] && source "$HOME/.zshenv"
# source $HOME/.config/op/plugins.sh

# User configuration

# Personal scripts
export PATH="$HOME/bin:$PATH"

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
# kill a process on a certain port
killPort() {
  if [[ -z "$1" ]]; then
    echo "usage: killPort <port>"
    return 1
  fi
  local pids=(${(f)"$(lsof -ti tcp:"$1")"})
  if [[ ${#pids} -eq 0 ]]; then
    echo "nothing running on port $1"
    return 0
  fi
  echo "killing PID(s) on port $1: $pids"
  kill -9 $pids
}

# Pack up an npm package and set it by the front door
function packAndMove() {
  DESTINATION=${1:=~/Desktop}
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
alias gnuke='[ -d .git ] && git branch | grep -v $(git rev-parse --abbrev-ref HEAD) | xargs git branch -D || echo "Not a git repository"'
alias glg='[ -d .git ] && git lg || echo "Not a git repository"'
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
alias transparencyScript="~/.config/kitty/toggle-transparency.sh"
alias kittyConfig="cd ~/.config/kitty && vim ."

toggleTransparency() {
    # Run your CLI command to toggle transparency
    "$HOME/.config/kitty/toggle-transparency.sh"
    # Use AppleScript to send Ctrl+Cmd+, to Kitty
    osascript -e 'tell application "System Events" to keystroke "," using {control down, command down}'
}

if [ -n "$TMUX" ]; then
  tmux wait-for -S zsh-config-loaded
  tmux wait-for -S tmux-config-loaded
  tmux wait-for -S nvim-config-loaded
fi

function gitup() {
  BRANCH=$(git branch --show-current)
  git branch --set-upstream-to=origin/$BRANCH $BRANCH
}

eval "$(rbenv init - zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm use node
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Python
export LDFLAGS="-L$(brew --prefix gettext)/lib -L$(brew --prefix zlib)/lib -L$(brew --prefix openssl)/lib  -L$(brew --prefix readline)/lib"
export CPPFLAGS="-I$(brew --prefix gettext)/include -I$(brew --prefix zlib)/include -I$(brew --prefix openssl)/include -I$(brew --prefix readline)/include"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# venv
alias venvactivate="source .venv/bin/activate &> /dev/null || source venv/bin/activate &> /dev/null || true"
venvactivate
alias venvcreate="uv venv ./.venv"
alias venvall="venvcreate && venvactivate"

# use config to handle git actions for dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# # Amazon Q post block. Keep at the bottom of this file.
# . "$HOME/.cargo/env"
[[ -f "$HOME/.cloudzerorc" ]] && source "$HOME/.cloudzerorc"
[[ -f "$HOME/.sumo-keys" ]] && source "$HOME/.sumo-keys" # The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/bendalton/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/bendalton/google-cloud-sdk/path.zsh.inc'; fi
[[ -f "$HOME/.launch-darkly-keys" ]] && source "$HOME/.launch-darkly-keys"

# The next line enables shell command completion for gcloud.
if [ -f '/Users/bendalton/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/bendalton/google-cloud-sdk/completion.zsh.inc'; fi

# pnpm
export PNPM_HOME="/Users/bendalton/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# rustup (installed via Homebrew: $(brew --prefix rustup)/bin)
export PATH="/opt/homebrew/opt/rustup/bin:$PATH"

export AWS_DEFAULT_SSO_START_URL=https://cloudzero.awsapps.com/start
export AWS_DEFAULT_SSO_REGION=us-east-1
export AWS_DEFAULT_REGION=us-east-1

# Kiro CLI post block. Keep at the bottom of this file.
# [[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh"

# Cortex MCP - Claude Code
# Secrets live in ~/.zshrc.local (never committed)
[[ -f "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"
