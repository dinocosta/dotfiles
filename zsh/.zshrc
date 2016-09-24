# Path to your oh-my-zsh installation.
export ZSH=/Users/joaocosta/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="pure"

# Theme specific configs.
PROMPT_GEOMETRY_GIT_CONFLICTS=true
BULLETTRAIN_PROMPT_CHAR=▶
BULLETTRAIN_PROMPT_ADD_NEWLINE=false
BULLETTRAIN_RUBY_SHOW=false
BULLETTRAIN_TIME_BG=green
BULLETTRAIN_TIME_FG=white
BULLETTRAIN_CONTEXT_SHOW=true

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
plugins=(git)

# User configuration

export PATH="/opt/local/bin:/opt/local/sbin:/Users/joaocosta/.cabal/bin:/Applications/ghc-7.8.4.app/Contents/bin:/Users/joaocosta/.rbenv/shims:/Users/joaocosta/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/texbin"
export PATH=~/miniconda3/bin:"$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG="pt_PT.UTF-8"

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias dev='cd ~/Developer'
# University related alias.
alias uni='cd ~/Universidade'
# Alias to clean xcode.
alias xcodeclean="rm -frd ~/Library/Developer/Xcode/DerivedData/* && rm -frd ~/Library/Caches/com.apple.dt.Xcode/*"
alias simulatorclean="rm -rfd ~/Library/Developer/CoreSimulator/*"

# function parse_git_branch {
#   ref=$(git symbolic-ref HEAD 2> /dev/null) || return
#   echo "("${ref#refs/heads/}")"
# }
#
# # ########## SYSTEM VARIABLE FOR HOME DIR ###########
#
# function get_pwd() {
#   echo "${PWD/#$HOME/~}"
# }
#
# # ########## GIT STATUS AND BATTERY INFORMATION ###########
#
# function put_spacing() {
#   local git=$(git_prompt_info)
#   if [ ${#git} != 0 ]; then
#       ((git=${#git} - 10))
#   else
#       git=0
#   fi
#
#   local termwidth
#   (( termwidth = ${COLUMNS} - 3 - ${#HOST} - ${#$(get_pwd)} - ${git} ))
#
#   local spacing=""
#   for i in {1..$termwidth}; do
#       spacing="${spacing} "
#   done
#   echo $spacing
# }
#
# # ########## GIT VARIABLES ###########
# # Outputs the name of the current branch
# # Usage example: git pull origin $(git_current_branch)
# # # Using '--quiet' with 'symbolic-ref' will not cause a fatal error (128) if
# # # it's not a symbolic ref, but in a Git repo.
# function git_current_branch() {
#   local ref
#   ref=$(command git symbolic-ref --quiet HEAD 2> /dev/null)
#   local ret=$?
#   if [[ $ret != 0 ]]; then
#     [[ $ret == 128 ]] && return  # no git repo.
#     ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
#   fi
#   echo ${ref#refs/heads/}
# }
#
# function git_prompt_info() {
#   ref=$(git symbolic-ref HEAD 2> /dev/null) || return
#   echo "%{$reset_color%}[$(parse_git_dirty)%{$reset_color%}$(git_current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX]"
# }
#
# function prompt_char {
#   git branch >/dev/null 2>/dev/null && echo '○' && return
#   echo '>'
# }
#
# # ########## ZSH GIT THEME VARIABLES ###########
#
# ZSH_THEME_GIT_PROMPT_PREFIX="git:"
# ZSH_THEME_GIT_PROMPT_SUFFIX="$reset_color"
# ZSH_THEME_GIT_PROMPT_DIRTY="$fg[red]✹ "
# ZSH_THEME_GIT_PROMPT_CLEAN="$fg[white]"

autoload -U colors && colors
autoload -U promptinit && promptinit
#PS1="%{$fg[red]%}[%T] %{$fg[green]%}%~%{$fg[black]%} \$(git_prompt_info)%{$reset_color%}▶ "

export TERM="xterm-256color"
