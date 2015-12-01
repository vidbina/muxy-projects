cd $BASE

export AWS_DEFAULT_PROFILE=tmh
export TEMPORARY="$(brew --prefix nvm)/nvm.sh"
source $(brew --prefix nvm)/nvm.sh

tmux start-server

tmux new-session -d -s $SESSION -n base

tmux send-keys -t $SESSION:0 "" C-m
tmux split-window -h -t $SESSION:0
tmux send-keys -t $SESSION:0 "cd $BASE/notes" C-m

tmux new-window -t $SESSION:1 -n concept

tmux attach-session -t $SESSION
