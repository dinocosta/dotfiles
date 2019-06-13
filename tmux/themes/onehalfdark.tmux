# Inactive/Active Window Styles
# I recommend only setting these if you remove the inactive/active pane styles.
#
# set -g window-style 'bg=colour236'
# set -g window-active-style 'bg=colour236'

# DARK BACKGROUND

# Panes.
set -g pane-border-style fg=colour255
set -g pane-active-border-style fg=colour1

setw -g status-bg colour255
setw -g status-fg colour0
set -g status-interval 60
set -g status-left-length 30
set -g status-right-length 70
set -g status-left ' '
set -g status-right '#[fg=colour0]#(sysctl -n vm.loadavg | cut -d"{" -f2 | cut -d"}" -f1)\
#[fg=default]:: #[fg=colour32]#(bash $DOTFILES/tmux/tmux-cpu.bash)\
#[fg=default] :: #[fg=colour71]#(bash $DOTFILES/tmux/tmux-battery.bash)\
#[fg=default] :: #[fg=colour167]#($DOTFILES/tmux/osx-cpu-temp)\
#[fg=default] | %a %d/%m - %H:%M '

# Windows in status bar.
setw -g window-status-style fg=colour0,bg=colour255

# Current windows in status bar.
setw -g window-status-current-style fg=colour255,bg=colour167
set -g window-status-current-format ' #I#[fg=colour0]:#[fg=colour255]#W#[fg=colour0]#F '
