cd $BASE
LAB="/Volumes/studio/lab/vita"
VAGRANT_HOME="$LAB/.vagrant.d"

if [ -d /Volumes/studio ]; then
  COLNIL="\033[0m"
  COLCMD="\033[32m"
  COLDIR="\033[34m"
  COLPROP="\033[33m"
  COLSTRONG="\033[1;4;31m"
  COLNAME="\033[36m"
  REMINDER="Follow the instructions to ${COLSTRONG}undo$COLNIL the changes made
  to the system by ${COLNAME}muxy$COLNIL
  \n\n\r
  In order to setup VirtualBox to work from the lab directory the
  ${COLPROP}machinefolder$COLNIL has been set to $COLDIR$LAB/vms$COLNIL.
  \n\r
  Undo that by running: 
  ${COLCMD}VBoxManage setproperty machinefolder default$COLNIL"
#  #
#  #tmux new-window -t $SESSION:4 -n lab
#  #tmux send-keys -t $SESSION:4 "unmux() { $REMINDER }"
#  #tmux send-keys -t $SESSION:4 "cd $LAB" C-m
#  #tmux split-window -h -t $SESSION:4
#  #tmux send-keys -t $SESSION:4 "unmux() { $REMINDER }"
#  #tmux send-keys -t $SESSION:4 "cd $LAB" C-m
fi

tmux start-server

tmux new-session -d -s $SESSION -n base
tmux send-keys -t $SESSION:0 "source $BASE/azure/bin/activate" C-m
tmux split-window -h -t $SESSION:0
tmux send-keys -t $SESSION:0 "source $BASE/azure/bin/activate" C-m

tmux new-window -t $SESSION:1 -n infra
tmux send-keys -t $SESSION:1 "source $BASE/azure/bin/activate" C-m
tmux split-window -h -t $SESSION:1
tmux send-keys -t $SESSION:1 "source $BASE/azure/bin/activate" C-m

if [ -d /Volumes/studio ]; then
  echo "got studio connected"
  tmux new-window -t $SESSION:4 -n lab
  tmux send-keys -t $SESSION:4 "export VAGRANT_HOME=$VAGRANT_HOME" C-m
  tmux send-keys -t $SESSION:4 "VBoxManage setproperty machinefolder $LAB/vbox" C-m
  #tmux send-keys -t $SESSION:4 "unmux() { echo "$REMINDER" }"
  tmux send-keys -t $SESSION:4 "cd $LAB" C-m
  tmux split-window -h -t $SESSION:4
  tmux send-keys -t $SESSION:4 "export VAGRANT_HOME=$VAGRANT_HOME" C-m
  tmux send-keys -t $SESSION:4 "VBoxManage setproperty machinefolder $LAB/vbox" C-m
#  #tmux send-keys -t $SESSION:4 "unmux() { $REMINDER }"
  tmux send-keys -t $SESSION:4 "cd $LAB" C-m
fi

#tmux new-window -t $NAME:2 -n web
#tmux new-window -t $NAME:3 -n web-base


#tmux new-window -t $NAME:4 -n app
#tmux new-window -t $NAME:5 -n app-base

tmux attach-session -t $SESSION
