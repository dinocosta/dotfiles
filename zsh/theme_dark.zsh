# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"

SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  exec_time     # Execution time
  line_sep      # Line break
  char          # Prompt character
)

export SPACESHIP_DIR_COLOR="blue"
export SPACESHIP_GIT_BRANCH_COLOR="242"
export SPACESHIP_CHAR_COLOR_SUCCESS="white"
export SPACESHIP_CHAR_SYMBOL="▶ "
export SPACESHIP_DIR_TRUNC_REPO="false"
export COMPOSE_PATH_SEPARATOR=":"
export SPACESHIP_PROMPT_DEFAULT_PREFIX=":: "
export SPACESHIP_EXEC_TIME_PREFIX=":: "
export SPACESHIP_GIT_PREFIX="⬢ "
export SPACESHIP_VENV_COLOR="green"
export SPACESHIP_ELIXIR_SYMBOL=""
export SPACESHIP_GIT_SYMBOL=""

# Set bat's theme to OneHalfDark.
export BAT_THEME="OneHalfDark"
