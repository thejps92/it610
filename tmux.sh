#!/bin/bash

# Uses tmux to create a new tmux terminal session called "session"
# Options: "-d" is used to start the new tmux terminal session in detached mode meaning it runs in the background and "-s" is used to specify the name of the new tmux terminal session
tmux new-session -d -s session

# Uses tmux to split the tmux terminal session into two horizontal panes essentially creating two tmux terminal instances
# Options: "-h" is used to specify a horizontal split
tmux split-window -h

# Uses tmux to send keyboard input to the first tmux terminal pane in the first tmux terminal session where that input is "./minecraft.sh" followed by the "Enter" key (The Minecraft server will be started in this tmux terminal pane)
# Options: "-t" is used to specify the target tmux terminal pane
tmux send-keys -t ":0.0" ./minecraft.sh Enter

# Uses tmux to send keyboard input to the second tmux terminal pane in the first tmux terminal session where that input is "./ngrok.sh" followed by the "Enter" key (ngrok will be started in this tmux terminal pane)
# Options: "-t" is used to specify the target tmux terminal pane
tmux send-keys -t ":0.1" ./ngrok.sh Enter

# Uses tmux to attach to a specific tmux terminal session called "session" so that the tmux terminal panes in that tmux terminal session are visible and interactable
# Options: "-t" is used to specify the target tmux terminal session
tmux attach-session -t session