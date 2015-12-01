cd $BASE

tmux start-server

tmux new-session -d -s $NAME -n base

tmux send-keys -t $NAME:0 "  cd $BASE/MachineLearning" C-m
tmux send-keys -t $NAME:0 "  git log --oneline --graph --all --decorate" C-m
tmux split-window -h -t $NAME:0
tmux send-keys -t $NAME:0 "  cd $BASE/MachineLearning" C-m
tmux send-keys -t $NAME:0 "  git status -uno" C-m

tmux new-window -t $NAME:1 -n doc
tmux send-keys -t $NAME:1 "  cd $BASE/MachineLearning" C-m
tmux send-keys -t $NAME:1 "  git show" C-m
#tmux send-keys -t $NAME:0 "source .activate.bash" C-m

#tmux send-keys -t $NAME:1 "cd $BASE/core" C-m
#tmux send-keys -t $NAME:1 "source .activate.bash" C-m
#tmux send-keys -t $NAME:1 "source .dev.env" C-m
tmux split-window -h -t $NAME:1
#tmux send-keys -t $NAME:1 "cd $BASE/core" C-m
#tmux send-keys -t $NAME:1 "source .activate.bash" C-m
#tmux send-keys -t $NAME:1 "source .dev.env" C-m
#tmux send-keys -t $NAME:1 "cat Makefile" C-m

tmux attach-session -t $NAME
