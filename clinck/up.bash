cd $BASE

tmux start-server

tmux new-session -d -s $NAME -n base
tmux new-window -t $NAME:1 -n fog

#tmux send-keys -t $NAME:1 "cd $BASE/blog/_posts" C-m
#tmux split-window -h -t $NAME:1
#tmux send-keys -t $NAME:1 "cd $BASE/blog" C-m

#tmux send-keys -t $NAME:1 "cd $BASE/svn" C-m
#tmux send-keys -t $NAME:1 "" C-m
tmux split-window -h -t $NAME:1
#tmux send-keys -t $NAME:1 "cd $BASE/svn" C-m
#tmux send-keys -t $NAME:0 "rake site:serve"

tmux attach-session -t $NAME
