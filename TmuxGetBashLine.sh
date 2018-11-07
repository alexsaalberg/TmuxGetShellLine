#!/usr/bin/env bash
# This script expects the complete contents of PS1 to be the first argument

# if you wanna try this out try this
# bind -x '"\110":<SCRIPT_LOCATION> "$PS1"'
# which will bind 'H' (capital H) to a command which properly runs this script

# get the contents of the current pane
pane_contents=$(tmux capture-pane -p) 

# for @P details see 'Shell Parameter Expansion' on gnu.org
prompt="${1@P}" 

# get just the last line of the pane contents which contains the prompt
prompt_and_contents="$(echo "$pane_contents" | grep "$prompt" | tail -n 1)"

# strip the prompt from ^ so we just have the contents after the $PS1
bash_contents=${prompt_and_contents#$prompt}

# "return" the result
echo $bash_contents
