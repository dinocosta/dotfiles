# vi: ft=tmux

# Colors.
BLACK="#282c34"
RED="#e06c75"
GREEN="#98c379"
YELLOW="#35c07b"
BLUE="#61afef"
PURPLE="#c678dd"
CYAN="#56b6c2"
GRAY="#abb2bf"
WHITE="#ffffff"
LIGHT_GRAY="#2C323C"
LIGHTER_GRAY="#3B4048"

# Panes.
set -g pane-border-style fg=$LIGHT_GRAY
set -g pane-active-border-style fg=$LIGHTER_GRAY

# Status bar default configurations..
setw -g status-bg $BLACK
setw -g status-fg $WHITE
set -g status-interval 60
set -g status-left-length 30
set -g status-right-length 70
set -g status-left ''

# Current windows in status bar.
setw -g window-status-current-style fg=$BLACK,bg=$WHITE
set -g window-status-current-format ' #I#[fg=#{RED}]:#[fg=#{BLACK}]#W#[fg=#{RED}]#F '

# Windows in status bar.
setw -g window-status-style fg=$WHITE,bg=$BLACK
set -g window-status-format ' #I#[fg=#{RED}]:#[fg=default]#W#[fg=#{RED}]#F '

setw -g status-right-style fg=$BLACK,bg=$WHITE
set -g status-right '#[fg=#{LIGHT_GRAY}]#(sysctl -n vm.loadavg | cut -d"{" -f2 | cut -d"}" -f1)\
#[fg=#{LIGHT_GRAY}]:: #[fg=#{BLUE}]#(bash $DOTFILES/tmux/tmux-cpu.bash)\
 #[fg=#{LIGHT_GRAY}]:: #[fg=#{GREEN}]#(bash $DOTFILES/tmux/tmux-battery.bash)\
 #[fg=#{LIGHT_GRAY}]:: #[fg=#{RED}]#($DOTFILES/tmux/osx-cpu-temp)\
 #[fg=#{WHITE},bg=#{BLACK}] %a %d/%m - %H:%M '

# Window Status style whenever bell rings.
setw -g window-status-activity-style fg=$WHITE,bg=$BLACK
