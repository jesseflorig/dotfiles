#!/bin/bash
# Author: Jesse Florig
# Purpose: Automatically setup a TMUX session for development
# Overview:
# +------------------+
# |        |  ES     |
# |        +---------+
# |  VIM   |  RUN    |
# |        +---------+
# |        |  SERVE  |
# +------------------+  

SESSION_NM=dataviser
WINDOW_NM=main
EDIT_CMD="cdv && deactivate && vi"
TUNNEL_CMD="sshdv"
RUN_CMD="cdv && workon dataviser && make run"
SERVE_CMD="cdv && deactivate && make serve"

function send-command () {
  tmux send-keys -t $SESSION_NM "$1" C-m
}

function split () {
  tmux split-window -$1 -t $SESSION_NM
}

tmux has-session -t $SESSION_NM
if [ $? != 0 ]                             # if the session does not exist
then
  tmux new -s $SESSION_NM -n $WINDOW_NM -d # create new detached session with named window
  send-command "$EDIT_CMD"                 # start vim
  split "h"
  send-command "$TUNNEL_CMD"               # setup backend tunnel
  split "v"
  send-command "$RUN_CMD"                  # start flask
  split "v"
  send-command "$SERVE_CMD"                # start webpack
fi                                                   
tmux attach -t $SESSION_NM                 # attach to the newly created session
