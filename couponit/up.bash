cd $BASE

tmux start-server

tmux new-session -d -s $NAME -n coopon

#tmux new-window -t $NAME:10 -n daemons
#tmux send-keys -t $NAME:10 "mongod --dbpath db"
#tmux split-window -h -t $NAME:10
#tmux send-keys -t $NAME:10 "cd rails c"

#tmux new-window -t $NAME:1 -n base
#tmux new-window -t $NAME:2 -n app

#tmux new-window -t $NAME:1 -n muve-store-mongo
#tmux new-window -t $NAME:2 -n muve-core
#tmux new-window -t $NAME:10 -n daemons

#tmux send-keys -t $NAME:10 "mongod --dbpath db" C-m
#tmux split-window -h -t $NAME:10
#tmux send-keys -t $NAME:10 "rabbitmq-server" C-m
#
#tmux send-keys -t $NAME:0 "cd $BASE/muve" C-m
#tmux send-keys -t $NAME:0 "git log --oneline --graph --all --decorate" C-m
#tmux split-window -h -t $NAME:0
#tmux send-keys -t $NAME:0 "cd $BASE/muve" C-m
#tmux send-keys -t $NAME:0 "rake spec"
#
#tmux send-keys -t $NAME:1 "cd $BASE/muve-store-mongo" C-m
#tmux send-keys -t $NAME:1 "git log --oneline --graph --all --decorate" C-m
#tmux split-window -h -t $NAME:1
#tmux send-keys -t $NAME:1 "cd $BASE/muve-store-mongo" C-m
#tmux send-keys -t $NAME:1 "rake spec"
#
#tmux send-keys -t $NAME:2 "cd $BASE/a2a-core" C-m
#tmux send-keys -t $NAME:2 "git log --oneline --graph --all --decorate" C-m
#tmux split-window -h -t $NAME:2
#tmux send-keys -t $NAME:2 "cd $BASE/a2a-core" C-m
#tmux send-keys -t $NAME:2 "git status" C-m

tmux attach-session -t $NAME
