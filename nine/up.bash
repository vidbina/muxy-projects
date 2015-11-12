cd $BASE

tmux start-server

tmux new-session -d -s $NAME -n base

tmux new-window -t $NAME:1 -n code

tmux send-keys -t $NAME:0 "  cd $BASE/website" C-m
tmux send-keys -t $NAME:0 "  git log --oneline --graph --all --decorate" C-m
tmux split-window -h -t $NAME:0
tmux send-keys -t $NAME:0 "  cd $BASE/vagrant" C-m
tmux send-keys -t $NAME:0 "  vagrant up"
tmux split-window -v -t $NAME:0
tmux send-keys -t $NAME:0 "  cd $BASE/vagrant" C-m
tmux send-keys -t $NAME:0 "  vagrant ssh"

tmux send-keys -t $NAME:1 "cd $BASE/website" C-m
tmux split-window -h -t $NAME:1
tmux send-keys -t $NAME:1 "cd $BASE/website" C-m

tmux attach-session -t $NAME
