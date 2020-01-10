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

# Panes.
set -g pane-border-style fg=$LIGHT_GRAY
set -g pane-active-border-style fg=$WHITE

setw -g status-bg $LIGHT_GRAY
setw -g status-fg $BLACK
set -g status-interval 60
set -g status-left-length 30
set -g status-right-length 70
set -g status-left ''

# Current windows in status bar.
setw -g window-status-current-style fg=$GRAY,bg=$RED
set -g window-status-current-format ' #[fg=#{BLACK}]#I#[fg=#{WHITE}]:#[fg=#{BLACK}]#W#[fg=colour255]#F '

# Windows in status bar.
setw -g window-status-style fg=$GRAY,bg=$LIGHT_GRAY
set -g window-status-format ' #I#[fg=#{RED}]:#[fg=#{GRAY}]#W#[fg=#{RED}]#F '

set -g status-right-style bg=$GRAY
set -g status-right '#[bg=#{LIGHT_GRAY}]\
#[fg=#{GRAY}]#(sysctl -n vm.loadavg | cut -d"{" -f2 | cut -d"}" -f1)\
#[fg=#{WHITE}]:: #[fg=#{BLUE}]#(bash $DOTFILES/tmux/tmux-cpu.bash)\
 #[fg=#{WHITE}]:: #[fg=#{GREEN}]#(bash $DOTFILES/tmux/tmux-battery.bash)\
 #[fg=#{WHITE}]:: #[fg=#{RED}]#($DOTFILES/tmux/osx-cpu-temp)\
 #[fg=#{BLACK}] #[bg=#{GRAY}] %a %d/%m - %H:%M '

# Window Status style whenever bell rings.
set-option -gw window-status-activity-style bg=$LIGHT_GRAY
