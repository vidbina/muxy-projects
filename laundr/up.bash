cd $BASE

tmux start-server

tmux new-session -d -s $NAME -n backend 
tmux new-window -t $NAME:1 -n server
tmux new-window -t $NAME:2 -n mobile
tmux new-window -t $NAME:3 -n cordova

tmux send-keys -t $NAME:0 "cd $BASE/core" C-m
tmux send-keys -t $NAME:0 "source .activate.bash" C-m

tmux send-keys -t $NAME:1 "cd $BASE/core" C-m
tmux send-keys -t $NAME:1 "source .activate.bash" C-m
tmux send-keys -t $NAME:1 "source .dev.env" C-m
tmux split-window -h -t $NAME:1
tmux send-keys -t $NAME:1 "cd $BASE/core" C-m
tmux send-keys -t $NAME:1 "source .activate.bash" C-m
tmux send-keys -t $NAME:1 "source .dev.env" C-m
tmux send-keys -t $NAME:1 "cat Makefile" C-m

tmux send-keys -t $NAME:2 "cd $BASE/mobile-app" C-m
tmux send-keys -t $NAME:2 "source env/bin/activate" C-m

tmux send-keys -t $NAME:3 "cd $BASE/mobile-app" C-m
tmux send-keys -t $NAME:3 "source env/bin/activate" C-m

tmux attach-session -t $NAME
