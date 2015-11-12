cd $BASE

tmux start-server

tmux new-session -d -s $NAME -n base

tmux new-window -t $NAME:1 -n code

tmux send-keys -t $NAME:0 "cd $BASE/zzp" C-m
tmux send-keys -t $NAME:0 "git log --oneline --graph --all --decorate" C-m
tmux split-window -h -t $NAME:0
tmux send-keys -t $NAME:0 "cd $BASE/zzp" C-m
tmux send-keys -t $NAME:0 "open http://jira.jobsrepublic.nl" C-m
tmux send-keys -t $NAME:0 "jekyll serve"

tmux send-keys -t $NAME:1 "cd $BASE/zzp" C-m
tmux split-window -h -t $NAME:1
tmux send-keys -t $NAME:1 "cd $BASE/zzp" C-m

tmux attach-session -t $NAME
