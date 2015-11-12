cd $BASE
# NODEENV_DIR="/Volumes/supr-tosh/nodeenv-vigour"
export NODEENV_DIR="/Users/david/Documents/Development/vigour.io/env"
export ANDROID_HOME="/Volumes/spare/android-sdk-macosx"

tmux start-server

tmux new-session -d -s $SESSION -n base

if [[ -d /Volumes/supr-tosh ]]; then
  echo "got supr-tosh connected"

  tmux new-window -t $SESSION:10 -n 💓
  tmux send-keys -t $SESSION:10 "  while true; do cd $BASE; ls; date +%H%M%S; sleep 10; cd ..; done" C-m

  tmux send-keys -t $SESSION:0 "  source $NODEENV_DIR/bin/activate" C-m
  tmux send-keys -t $SESSION:0 "  cd $BASE" C-m
  tmux split-window -h -t $SESSION:0
  tmux send-keys -t $SESSION:0 "  source $NODEENV_DIR/bin/activate" C-m
  tmux send-keys -t $SESSION:0 "  cd $BASE" C-m

  tmux new-window -t $SESSION:1 -n gaston
  tmux send-keys -t $SESSION:1 "  source $NODEENV_DIR/bin/activate" C-m
  tmux send-keys -t $SESSION:1 "  cd $BASE/gaston" C-m
  tmux split-window -h -t $SESSION:1
  tmux send-keys -t $SESSION:1 "  source $NODEENV_DIR/bin/activate" C-m
  tmux send-keys -t $SESSION:1 "  cd $BASE/gaston" C-m

  tmux new-window -t $SESSION:2 -n vigour-native
  tmux send-keys -t $SESSION:2 "  source $NODEENV_DIR/bin/activate" C-m
  tmux send-keys -t $SESSION:2 "  cd $BASE/vigour-native" C-m
  tmux split-window -h -t $SESSION:2
  tmux send-keys -t $SESSION:2 "  source $NODEENV_DIR/bin/activate" C-m
  tmux send-keys -t $SESSION:2 "  cd $BASE/vigour-native" C-m

  tmux new-window -t $SESSION:5 -n android
  tmux send-keys -t $SESSION:5 "  source $NODEENV_DIR/bin/activate" C-m
  tmux send-keys -t $SESSION:5 "  source $BASE/setup-android-home.sh" C-m
  tmux send-keys -t $SESSION:5 "  cd $BASE/vigour-native/templates/android" C-m
  tmux split-window -h -t $SESSION:5
  tmux send-keys -t $SESSION:5 "  source $NODEENV_DIR/bin/activate" C-m
  tmux send-keys -t $SESSION:5 "  source $BASE/setup-android-home.sh" C-m
  tmux send-keys -t $SESSION:5 "  cd $BASE/vigour-native" C-m
else
  echo "supr-tosh not connected, connect drive and try again"
fi

tmux attach-session -t $SESSION
