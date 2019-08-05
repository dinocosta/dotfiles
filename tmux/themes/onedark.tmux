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

# Panes.
set -g pane-border-style fg=colour235
set -g pane-active-border-style fg=$GRAY

setw -g status-bg colour0
setw -g status-fg colour231
set -g status-interval 60
set -g status-left-length 30
set -g status-right-length 70
set -g status-left ''

# Current windows in status bar.
setw -g window-status-current-style fg=$GRAY,bg=colour0
set -g window-status-current-format '#[fg=colour167]#I#[fg=colour255]:#[fg=colour167]#W#[fg=colour255]#F '

# Windows in status bar.
setw -g window-status-style fg=$GRAY,bg=colour0
set -g window-status-format '#I#[fg=default]:#[fg=#{GRAY}]#W#F '

set -g status-right '#[fg=#{GRAY}]#(sysctl -n vm.loadavg | cut -d"{" -f2 | cut -d"}" -f1)\
#[fg=default]:: #[fg=#{BLUE}]#(bash $DOTFILES/tmux/tmux-cpu.bash)\
 #[fg=default]:: #[fg=#{GREEN}]#(bash $DOTFILES/tmux/tmux-battery.bash)\
 #[fg=default]:: #[fg=#{RED}]#($DOTFILES/tmux/osx-cpu-temp)\
#[fg=#{GRAY}] | %a %d/%m - %H:%M '
