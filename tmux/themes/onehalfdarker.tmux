# # Panes.
set -g pane-border-style fg=colour235
set -g pane-active-border-style fg=colour253

setw -g status-bg colour0
setw -g status-fg colour231
set -g status-interval 60
set -g status-left-length 30
set -g status-right-length 70
set -g status-left ''

# Current windows in status bar.
setw -g window-status-current-style fg=colour255,bg=colour0
set -g window-status-current-format '#[fg=colour167]#I#[fg=colour255]:#[fg=colour167]#W#[fg=colour255]#F '
set -g window-status-format '#[fg=colour255]#[bg=colour0]#I:#W#F '

set -g status-right '#[fg=colour253]#(sysctl -n vm.loadavg | cut -d"{" -f2 | cut -d"}" -f1)\
#[fg=default]:: #[fg=colour74]#(bash $DOTFILES/tmux/tmux-cpu.bash)\
 #[fg=default]:: #[fg=colour71]#(bash $DOTFILES/tmux/tmux-battery.bash)\
 #[fg=default]:: #[fg=colour167]#($DOTFILES/tmux/osx-cpu-temp)\
#[fg=default] | %a %d/%m - %H:%M '

# Windows in status bar.
setw -g window-status-style fg=colour255,bg=colour0
