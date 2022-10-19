#!/bin/bash

SESSION="gis-app"

SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)

if ["$SESSIONEXISTS" = ""]
then
  # run project servers with one extra terminal for fun
  tmux new-session -d -s $SESSION 
  tmux rename-window -t 0 'trifecta'
  tmux send-keys -t 'trifecta' 'zsh' C-m 'clear' C-m
  tmux split-window -h -p 50
  tmux split-window -t 0 -v -p 66
  tmux split-window -v -p 50
  tmux send-keys -t 0 'rscli' C-m
  tmux send-keys -t 1 'rswebapp' C-m
  tmux send-keys -t 2 'rsgis' C-m
  tmux send-keys -t 3 'gis' C-m

  # vim for code editing
  tmux new-window -t $SESSION:1 -n 'vim'
  tmux send-keys -t 'vim' 'gis && vim .' C-m
  tmux send-keys -t 'vim' ' ff'

  # vim for notes
  tmux new-window -t $SESSION:2 -n 'notes'
  tmux send-keys -t 'notes' 'notes && vim .' C-m
  tmux split-window -h -p 20
  tmux send-keys -t 'notes' 'notes && gitwatch ~/Projects/zettelkasten' C-m
fi

tmux attach-session -t $SESSION:0
