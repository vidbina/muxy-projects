cd $BASE

tmux start-server

tmux new-session -d -s $NAME -n base
tmux new-window -t $NAME:1 -n app

#tmux send-keys -t $NAME:0 "cd $BASE/core" C-m
#tmux send-keys -t $NAME:0 "source .activate.bash" C-m

#tmux send-keys -t $NAME:1 "cd $BASE/core" C-m
#tmux send-keys -t $NAME:1 "source .activate.bash" C-m
#tmux send-keys -t $NAME:1 "source .dev.env" C-m
tmux split-window -h -t $NAME:1
#tmux send-keys -t $NAME:1 "cd $BASE/core" C-m
#tmux send-keys -t $NAME:1 "source .activate.bash" C-m
#tmux send-keys -t $NAME:1 "source .dev.env" C-m
#tmux send-keys -t $NAME:1 "cat Makefile" C-m
