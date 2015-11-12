tmux start-server

tmux new-session -d -s $NAME -n base
tmux new-window -t $NAME:1 -n app
tmux new-window -t $NAME:2 -n cordova
tmux new-window -t $NAME:3 -n cdv
tmux new-window -t $NAME:4 -n cdv-js

tmux send-keys -t $NAME:0 "cd $BASE/ParkNPay/ParkNRide" C-m
tmux send-keys -t $NAME:0 "git status" C-m
tmux split-window -h -t $NAME:0
tmux send-keys -t $NAME:0 "cd $BASE/ParkNPay/ParkNRide" C-m
tmux send-keys -t $NAME:0 "git log --oneline --graph --all --decorate" C-m

tmux send-keys -t $NAME:1 "cd $BASE/ParkNPay/ParkNRide" C-m

tmux send-keys -t $NAME:2 "cd $BASE/ParkNPay/ParkNRide" C-m
tmux send-keys -t $NAME:2 "prep-android" C-m
tmux send-keys -t $NAME:2 "source ../.env/bin/activate" C-m
tmux send-keys -t $NAME:2 "which android" C-m
tmux send-keys -t $NAME:2 "which cordova" C-m
tmux send-keys -t $NAME:2 "which ios-deploy" C-m

tmux send-keys -t $NAME:3 "cd $BASE/PhoneGap_Audio_Watermarks/apps/Themed Application/Basic_Audio_Watermarks/Plugins/PitchDetection" C-m

tmux send-keys -t $NAME:4 "cd $BASE/PhoneGap_Audio_Watermarks/apps/Themed Application/www/js" C-m
#tmux send-keys -t $NAME:8 "cd $BASE/ParkNPay/ParkNRide" C-m
#tmux send-keys -t $NAME:8 "source ../.env/bin/activate" C-m
#tmux send-keys -t $NAME:8 "prep-android" C-m
#tmux send-keys -t $NAME:8 "make android"

#tmux send-keys -t $NAME:9 "cd $BASE/ParkNPay/ParkNRide" C-m
#tmux send-keys -t $NAME:9 "source ../.env/bin/activate" C-m

#tmux send-keys -t $NAME:10 "cd $BASE" C-m
#tmux send-keys -t $NAME:10 "source ../.env/bin/activate" C-m

tmux attach-session -t $NAME
