tmux start-server

tmux new-session -d -s $NAME -n playground
tmux new-window -t $NAME:1 -n base
tmux new-window -t $NAME:2 -n theme
tmux new-window -t $NAME:3 -n spree
#tmux new-window -t $NAME:10 -n playground

tmux send-keys -t $NAME:0 "cd $BASE/" C-m
tmux split-window -h -t $NAME:0
tmux send-keys -t $NAME:0 "cd $BASE/" C-m

#tmux send-keys -t $NAME:10 "cd $BASE/redesired" C-m
#tmux send-keys -t $NAME:10 "git log --oneline --graph --all --decorate" C-m
#tmux split-window -h -t $NAME:10
#tmux send-keys -t $NAME:10 "cd $BASE/redesired" C-m
#tmux send-keys -t $NAME:10 "git status" C-m

tmux send-keys -t $NAME:1 "cd $BASE/redesired" C-m
tmux send-keys -t $NAME:1 "git log --oneline --graph --all --decorate" C-m
tmux split-window -h -t $NAME:1
tmux send-keys -t $NAME:1 "cd $BASE/redesired" C-m
tmux send-keys -t $NAME:1 "rails server"

tmux send-keys -t $NAME:2 "cd $BASE/seniorita-theme" C-m
tmux send-keys -t $NAME:2 "ls" C-m
tmux split-window -h -t $NAME:2
tmux send-keys -t $NAME:2 "cd $BASE/seniorita-theme" C-m
tmux send-keys -t $NAME:2 "annyong"

tmux send-keys -t $NAME:3 "cd $BASE/spree" C-m
tmux send-keys -t $NAME:3 "git log --oneline --graph --all --decorate" C-m
tmux split-window -h -t $NAME:3
tmux send-keys -t $NAME:3 "cd $BASE/spree" C-m
tmux send-keys -t $NAME:3 "vi frontend/app/views/spree/layouts/spree_application.html.erb"

#tmux attach-session -t $NAME
