#!/bin/bash
# Author: Jesse Florig
# Purpose: Automatically setup a TMUX session for development

SESSION_NAME=dataviser
FIRST_WINDOW_NAME=main
EDIT_COMMAND="cdv && vim"
TUNNEL_COMMAND="sshdv"
PROJECT_RUN_COMMAND="workon dataviser && cdv && make run"

function send-command () {
  tmux send-keys -t $SESSION_NAME "$1" C-m
}

tmux has-session -t $SESSION_NAME
if [ $? != 0 ]                                       # if the session does not exist
then
  tmux new -s $SESSION_NAME -n $FIRST_WINDOW_NAME -d # create new detached session with named window
  send-command "$EDIT_COMMAND"                       # start vim
  tmux split-window -h -t $SESSION_NAME              # split window horizontally
  send-command "$TUNNEL_COMMAND"                     # setup backend tunnel
  tmux split-window -v -t $SESSION_NAME              # split window vertically
  send-command "$PROJECT_RUN_COMMAND"                # start project
  tmux select-window -t $SESSION_NAME:0.0            # select the first pane in the first window
fi                                                   # either way
tmux attach -t $SESSION_NAME                         # attach to the newly created session
