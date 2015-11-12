cd $BASE

tmux start-server

tmux new-session -d -s $NAME -n taxi
tmux new-window -t $NAME:3 -n dash

tmux send-keys -t $NAME:0 "  cd $BASE/taxi" C-m
tmux send-keys -t $NAME:0 "  source ../nodeenv/bin/activate" C-m
tmux send-keys -t $NAME:0 "  grunt "
tmux split-window -h -t $NAME:0
tmux send-keys -t $NAME:0 "  mkdir mongo; mongod --dbpath mongo; rm -rf mongo;"
#tmux send-keys -t $NAME:0 "git log --oneline --graph --all --decorate" C-m

tmux send-keys -t $NAME:3 "  cd $BASE/dash-alpha" C-m
tmux send-keys -t $NAME:3 "  git log --oneline --graph --all --decorate" C-m
tmux split-window -h -t $NAME:3
tmux send-keys -t $NAME:3 "  cd $BASE/dash-alpha" C-m

tmux attach-session -t $NAME
