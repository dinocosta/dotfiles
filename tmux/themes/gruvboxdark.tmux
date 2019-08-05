# # Panes.
set -g pane-border-style fg="#1d2021"
set -g pane-active-border-style fg="#ebdbb2"

setw -g status-bg "#1d2021"
setw -g status-fg "#ebdbb2"
set -g status-interval 60
set -g status-left-length 30
set -g status-right-length 70
set -g status-left ''

# Current windows in status bar.
setw -g window-status-current-style fg="#98971a",bg="#1d2021"
set -g window-status-current-format '#I#[fg=default]:#[fg=#98971a]#W#[fg=colour255]#F '
set -g window-status-format '#[fg=default]#[bg=#1d2021]#I:#W#F '

set -g status-right '#[fg=default]#(sysctl -n vm.loadavg | cut -d"{" -f2 | cut -d"}" -f1)\
#[fg=default]:: #[fg=#458588]#(bash $DOTFILES/tmux/tmux-cpu.bash)\
 #[fg=default]:: #[fg=#98971a]#(bash $DOTFILES/tmux/tmux-battery.bash)\
 #[fg=default]:: #[fg=#d79921]#($DOTFILES/tmux/osx-cpu-temp)\
#[fg=default] | %a %d/%m - %H:%M '

# Windows in status bar.
setw -g window-status-style fg=colour255,bg=colour0
