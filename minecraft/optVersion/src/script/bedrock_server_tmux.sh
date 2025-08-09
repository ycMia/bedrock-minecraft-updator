#!/bin/bash
#
#Please put this script at /home/minecraft/currentVersion, where the soft link is made
#
SESSION="mcs"
SERVER_CMD="/home/minecraft/currentVersion/bedrock_server" 
tmux new-session -d -s "$SESSION" "$SERVER_CMD"
tmux pipe-pane -t "$SESSION":0 -o 'systemd-cat -t minecraft-bedrock'
