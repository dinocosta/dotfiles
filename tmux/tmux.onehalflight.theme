# # Panes.
set -g pane-border-style fg=colour253
set -g pane-active-border-style fg=colour235

setw -g status-bg colour0
setw -g status-fg colour231
set -g status-interval 60
set -g status-left-length 30
set -g status-right-length 70
set -g status-left '[#S] #(whoami) | '
set -g window-status-current-format ' #I#[fg=blue]:#[fg=colour0]#W #[fg=colour71]#F '
set -g status-right '#[fg=colour253]#(sysctl -n vm.loadavg | cut -d"{" -f2 | cut -d"}" -f1)\
#[fg=default]:: #[fg=colour74]#(bash /usr/local/bin/tmux-cpu.bash)\
#[fg=default]:: #[fg=colour71]#(bash /usr/local/bin/tmux-battery.bash)\
#[fg=default]:: #[fg=colour167]#(/usr/local/bin/osx-cpu-temp)\
#[fg=default] | %a %d/%m - %H:%M '

# Windows in status bar.
setw -g window-status-style fg=colour255,bg=colour0

# Current windows in status bar.
setw -g window-status-current-style fg=colour0,bg=colour255
setw -g window-status-current-fg colour0
