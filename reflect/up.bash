cd $BASE

REFLECT_TEMPLATE="$BASE/reflect-template"
REFLECT_FIRMWARE="$BASE/reflect-template/applications/reflect2"
 
tmux start-server
tmux new-session -d -s $NAME -n analysis
#tmux new-window -t $NAME:1 -n notes
#tmux new-window -t $NAME:2 -n serial
tmux new-window -t $NAME:3 -n code
tmux new-window -t $NAME:4 -n git
tmux new-window -t $NAME:5 -n prog
#tmux new-window -t $NAME:6 -n mine-field
 
tmux send-keys -t $NAME:0 "cd $BASE/data" C-m
tmux send-keys -t $NAME:0 "ls" C-m

tmux split-window -h -t $NAME:0

tmux send-keys -t $NAME:1 "cd $BASE/Notes/positionsense" C-m

tmux send-keys -t $NAME:2 "cd $BASE/data" C-m
tmux send-keys -t $NAME:2 "source $BASE/env/bin/activate" C-m
tmux split-window -h -t $NAME:2
tmux send-keys -t $NAME:2 "source $BASE/env/bin/activate" C-m

tmux send-keys -t $NAME:3 "cd $REFLECT_FIRMWARE" C-m
tmux send-keys -t $NAME:3 "vi main.cpp" C-m

tmux send-keys -t $NAME:4 "cd $REFLECT_FIRMWARE" C-m
tmux send-keys -t $NAME:4 "source $BASE/env/bin/activate" C-m
tmux send-keys -t $NAME:4 "git log --oneline --graph --all --decorate" C-m
tmux split-window -h -t $NAME:4
tmux send-keys -t $NAME:4 "source $BASE/env/bin/activate" C-m
tmux send-keys -t $NAME:4 "cd $REFLECT_FIRMWARE" C-m

tmux select-window -t $NAME:5
tmux send-keys -t $NAME:5 "source $BASE/env/bin/activate" C-m
tmux send-keys -t $NAME:5 "source cd $REFLECT_TEMPLATE" C-m
tmux send-keys -t $NAME:5 "spark --version" C-m
tmux split-window -h -t $NAME:5
tmux send-keys -t $NAME:5 "source $BASE/env/bin/activate" C-m
tmux send-keys -t $NAME:5 "source cd $REFLECT_TEMPLATE" C-m
tmux send-keys -t $NAME:5 "spark --version" C-m

tmux attach-session -t $NAME
