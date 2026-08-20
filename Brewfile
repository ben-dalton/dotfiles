# Brewfile — restore on new machine with:  brew bundle --file=Brewfile
# Curated 2026-08-12 (migration audit): real deps only, transitive libs removed.
cask_args appdir: '/Applications'

tap 'homebrew/services'
tap 'pulumi/tap'

# --- CLI ---
brew 'autojump'
brew 'awscli'
brew 'aws-sam-cli'
brew 'bash'
brew 'bat'
brew 'catimg'
brew 'coreutils'
brew 'ctags'
brew 'docker', link: false
brew 'fswatch'
brew 'fzf'
brew 'gh'
brew 'git'
brew 'git-delta'
brew 'gitwatch'
brew 'glab'
brew 'gnu-sed'
brew 'graphviz'
brew 'htop'
brew 'imagemagick'
brew 'jq'
brew 'lazygit'
brew 'lua-language-server'
brew 'mas'
brew 'neovim'
brew 'nowplaying-cli'
brew 'pipx'
brew 'postgresql@15'
brew 'pyenv'
brew 'pyenv-virtualenv'
brew 'rbenv'
brew 'ripgrep'
brew 'rustup'
brew 'socat'
brew 'sqlite'
brew 'tailscale'
brew 'tmux'
brew 'tmuxinator'
brew 'tree'
brew 'tree-sitter'

# --- Terminals & dev apps ---
cask 'kitty'
cask 'iterm2'
cask 'visual-studio-code'
cask 'claude'
cask 'claude-code'
cask 'codex'

# --- Apps ---
cask '1password'
cask 'arc'
cask 'chatgpt'
cask 'cleanshot'            # license key in 1Password
cask 'clipy'
cask 'elgato-stream-deck'
cask 'figma'
cask 'firefox'
cask 'google-chrome'
cask 'google-drive'
cask 'hiddenbar'
cask 'loom'
cask 'meetingbar'
cask 'moom'                 # license key in 1Password
cask 'obsidian'
cask 'wispr-flow'
cask 'ytmdesktop-youtube-music'
# cask 'cursor'             # uncomment if still using alongside Kiro CLI
# cask 'postman'            # uncomment if needed
# cask 'bitwarden'          # dropped — using 1Password

# --- Fonts ---
cask 'font-fira-code'
cask 'font-hack-nerd-font'
cask 'font-maple-mono'
cask 'font-monaspice-nerd-font'
cask 'font-noto-sans-symbols-2'

# --- Mac App Store (sign in first) ---
mas 'Webcam Settings', id: 1610840452
# mas 'Amphetamine', id: 937984704   # uncomment if still used
# BetterSnapTool dropped — replaced by Moom

# --- npm globals ---
npm 'pnpm'
npm 'yarn'
npm 'corepack'
npm '@anthropic-ai/claude-code'
npm 'claude-flow'

# --- uv tools ---
# monorepo-tools bootstraps all CloudZero repos into ~/Source.
# PREREQ: clone ops-monorepo-tools to ~/Source first (runbook Phase 2, step 6).
uv 'monorepo-tools', source: 'file:///Users/bendalton/Source/ops-monorepo-tools'
vscode "albert.tabout"
vscode "atlassian.atlascode"
vscode "bierner.emojisense"
vscode "burkeholland.simple-react-snippets"
vscode "chakrounanas.turbo-console-log"
vscode "chiragpat.tomorrow-and-tomorrow-night-operator-mono-theme"
vscode "christian-kohler.npm-intellisense"
vscode "christian-kohler.path-intellisense"
vscode "danharris.dark-plus-redux-even-darker"
vscode "danielding.jsontotype"
vscode "dbaeumer.vscode-eslint"
vscode "eamodio.gitlens"
vscode "equimper.react-native-react-redux"
vscode "esbenp.prettier-vscode"
vscode "firsttris.vscode-jest-runner"
vscode "formulahendry.auto-rename-tag"
vscode "github.vscode-pull-request-github"
vscode "graphql.vscode-graphql-syntax"
vscode "graphql.vscode-graphql"
vscode "hediet.vscode-drawio"
vscode "henriiik.docker-linter"
vscode "humao.rest-client"
vscode "infeng.vscode-react-typescript"
vscode "lkytal.flatui"
vscode "mikestead.dotenv"
vscode "mrmlnc.vscode-pugbeautify"
vscode "mrmlnc.vscode-puglint"
vscode "mrmlnc.vscode-scss"
vscode "ms-azuretools.vscode-containers"
vscode "ms-azuretools.vscode-docker"
vscode "ms-dotnettools.csharp"
vscode "ms-dotnettools.vscode-dotnet-runtime"
vscode "ms-python.debugpy"
vscode "ms-python.python"
vscode "ms-python.vscode-pylance"
vscode "ms-python.vscode-python-envs"
vscode "ms-toolsai.jupyter-keymap"
vscode "ms-toolsai.jupyter-renderers"
vscode "ms-toolsai.jupyter"
vscode "ms-vscode-remote.remote-containers"
vscode "ms-vscode.theme-materialkit"
vscode "nrwl.angular-console"
vscode "pkief.material-icon-theme"
vscode "redhat.vscode-yaml"
vscode "richie5um2.vscode-sort-json"
vscode "sainoba.px-to-rem"
vscode "sldobri.daily"
vscode "styled-components.vscode-styled-components"
vscode "tomoki1207.pdf"
vscode "vscodevim.vim"
vscode "wallabyjs.quokka-vscode"
vscode "wesbos.theme-cobalt2"
vscode "wix.vscode-import-cost"
vscode "xabikos.reactsnippets"
vscode "yzhang.markdown-all-in-one"
vscode "zxh404.vscode-proto3"
