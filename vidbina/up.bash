cd $BASE

tmux start-server

tmux new-session -d -s $NAME -n site
tmux new-window -t $NAME:1 -n posts

tmux send-keys -t $NAME:0 "cd $BASE/blog" C-m
tmux send-keys -t $NAME:0 "git log --oneline --graph --all --decorate" C-m
tmux split-window -h -t $NAME:0
tmux send-keys -t $NAME:0 "cd $BASE/blog" C-m
tmux send-keys -t $NAME:0 "rake site:serve"

tmux send-keys -t $NAME:1 "cd $BASE/blog/_posts" C-m
tmux split-window -h -t $NAME:1
tmux send-keys -t $NAME:1 "cd $BASE/blog" C-m

tmux attach-session -t $NAME
