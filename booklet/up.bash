cd $BASE

tmux start-server

tmux new-session -d -s $NAME -n base

tmux new-window -t $NAME:1 -n core
tmux new-window -t $NAME:2 -n deploy
tmux new-window -t $NAME:10 -n daemons

#tmux send-keys -t $NAME:10 "mongod" C-m
#tmux split-window -h -t $NAME:10
#tmux send-keys -t $NAME:10 "rabbitmq-server" C-m

tmux send-keys -t $NAME:0 "cd $BASE/bookshelf" C-m
tmux send-keys -t $NAME:0 "git log --oneline --graph --all --decorate" C-m
tmux split-window -h -t $NAME:0
tmux send-keys -t $NAME:0 "cd $BASE/bookshelf" C-m
tmux send-keys -t $NAME:0 "rake spec"

tmux send-keys -t $NAME:1 "cd $BASE/bookshelf" C-m

tmux send-keys -t $NAME:2 "cd $BASE/bookshelf" C-m

tmux attach-session -t $NAME
