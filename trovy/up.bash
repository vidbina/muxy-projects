cd $BASE

tmux start-server

tmux new-session -d -s $NAME -n base

tmux new-window -t $NAME:1 -n web
#tmux new-window -t $NAME:2 -n web
#tmux new-window -t $NAME:3 -n web-base

#tmux new-window -t $NAME:4 -n app
#tmux new-window -t $NAME:5 -n app-base

tmux
