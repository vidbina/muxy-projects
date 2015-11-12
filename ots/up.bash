cd $BASE

tmux start-server

tmux new-session -d -s $NAME -n base
tmux new-window -t $NAME:1 -n studio
tmux new-window -t $NAME:2 -n studio

#tmux send-keys -t $NAME:1 "cd $BASE/blog/_posts" C-m
#tmux split-window -h -t $NAME:1
#tmux send-keys -t $NAME:1 "cd $BASE/blog" C-m

#tmux send-keys -t $NAME:0 "source $BASE/tools/nodeenv/bin/activate" C-m
tmux send-keys -t $NAME:0 "source $BASE/tools/nodeenv-react/bin/activate" C-m

tmux send-keys -t $NAME:1 "source $BASE/tools/nodeenv-react/bin/activate" C-m
tmux send-keys -t $NAME:1 "cd $BASE/products/Electron-React-Boilerplate" C-m
tmux send-keys -t $NAME:1 "  git log --oneline --graph --all --decorate" C-m
tmux split-window -h -t $NAME:1
tmux send-keys -t $NAME:1 "source $BASE/tools/nodeenv-react/bin/activate" C-m
tmux send-keys -t $NAME:1 "cd $BASE/products/Electron-React-Boilerplate" C-m
tmux send-keys -t $NAME:1 "  git diff --stat" C-m

tmux send-keys -t $NAME:2 "source $BASE/tools/nodeenv-react/bin/activate" C-m
tmux send-keys -t $NAME:2 "cd $BASE/products" C-m

#tmux send-keys -t $NAME:1 "source $BASE/tools/nodeenv/bin/activate" C-m
#tmux send-keys -t $NAME:1 "cd $BASE/products/studio" C-m
#tmux send-keys -t $NAME:1 "  git log --oneline --graph --all --decorate" C-m
#tmux split-window -h -t $NAME:1
#tmux send-keys -t $NAME:1 "source $BASE/tools/nodeenv/bin/activate" C-m
#tmux send-keys -t $NAME:1 "cd $BASE/products/studio" C-m
#tmux send-keys -t $NAME:1 "  git diff --stat" C-m

#tmux send-keys -t $NAME:2 "source $BASE/tools/nodeenv/bin/activate" C-m
#tmux send-keys -t $NAME:2 "cd $BASE/products" C-m

tmux attach-session -t $NAME
