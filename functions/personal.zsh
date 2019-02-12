# Personal shell functions.

# Activates a 25 minute Focus session from the terminal.
#
# If accepts a parameter which is the number of minutes although
# the default is 25 minutes.
focus () {
  minutes=${1:-25}

  open "focus://focus?minutes=$minutes"
}
