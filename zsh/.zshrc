export DOTFILES="$HOME/.dotfiles"

# Language.
LC_CTYPE='en_US.UTF-8'
LANG='en_US.UTF-8'
LC_NUMERIC="en_US.UTF-8"
LC_TIME="en_US.UTF-8"
LC_COLLATE="en_US.UTF-8"
LC_MONETARY="en_US.UTF-8"
LC_MESSAGES="en_US.UTF-8"
LC_PAPER="en_US.UTF-8"
LC_NAME="en_US.UTF-8" LC_ADDRESS="en_US.UTF-8"
LC_TELEPHONE="en_US.UTF-8"
LC_MEASUREMENT="en_US.UTF-8"
LC_IDENTIFICATION="en_US.UTF-8"
LC_ALL=
LANGUAGE=

# Terminal Type.
# export TERM='screen-256color'
# When using iTerm2 prefer this one:
export TERM='screen-256color'

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/joaocosta/.oh-my-zsh

source $DOTFILES/zsh/theme_light.zsh
source $DOTFILES/functions/functions.zsh
source $DOTFILES/functions/aliases.zsh

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  virtualenv
  kubectl
)

source $ZSH/oh-my-zsh.sh

# User configuration

export MANPATH="/usr/local/man:$MANPATH"
export PATH="/opt/local/bin:/opt/local/sbin:/Users/joaocosta/.cabal/bin:/Applications/ghc-7.8.4.app/Contents/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/texbin"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Virtualenvwrapper
export VIRTUALENVWRAPPER_PYTHON=/usr/local/Cellar/python/2.7.13/bin/python
source /usr/local/bin/virtualenvwrapper.sh
export WORKON_HOME=~/.virtualenvs

# Shell histority in IEx
export ERL_AFLAGS="-kernel shell_history enabled"

# Fuzzy Finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source /Users/joaocosta/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH="/usr/local/opt/mongodb@3.2/bin:$PATH"
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"

# Real vim
alias bim="vim"
export PATH="/usr/local/opt/gettext/bin:$PATH"
export DARK_BACKGROUND=True


# Needed for AWS Kubernetes Authenticator
export PATH=$PATH:/Users/joaocosta/go/bin

source ~/.secrets

# color for less and man
export MANPAGER='less -s -M +Gg'
export LESS="--RAW-CONTROL-CHARS"
lesscolors=$HOME/bin/.LESS_TERMCAP
[[ -f $lesscolors ]] && . $lesscolors
