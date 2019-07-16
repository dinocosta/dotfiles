# Panes.
set -g pane-border-style fg=colour253
set -g pane-active-border-style fg=colour235

# Status bar configuration.
setw -g status-bg white
setw -g status-fg black
set -g status-interval 60
set -g status-left-length 30
set -g status-right-length 90
set -g status-left ' '
set -g status-right '#[fg=black]#(sysctl -n vm.loadavg | cut -d"{" -f2 | cut -d"}" -f1)\
#[fg=default]:: #[fg=colour74][CPU] #(bash $DOTFILES/tmux/tmux-cpu.bash)\
 #[fg=default]:: #[fg=colour71][BAT] #(bash $DOTFILES/tmux/tmux-battery.bash)\
 #[fg=default]:: #[fg=colour167][TEMP] #($DOTFILES/tmux/osx-cpu-temp)\
#[fg=default] | %a %d/%m - %H:%M '

# Window configuration in status bar.
setw -g window-status-current-style fg=colour72,bg=white
setw -g window-status-style fg=black,bg=white
set -g window-status-current-format '#I#[fg=colour0]:#[fg=colour71]#W#[fg=colour0]#F '
set -g window-status-format '#[fg=black]#I:#W#F '
