#!/bin/bash

# Wait for the shell to be fully ready in each pane
sleep 1

# Open ~/.zshrc in a new window and then use 'wincmd =' to balance window sizes
tmux send-keys -t configs:zsh-config.0 'vim ~/.zshrc' C-m
tmux send-keys -t configs:zsh-config.0 ':vsp ~/.zshrc' C-m
tmux send-keys -t configs:zsh-config.0 ':wincmd =' C-m

# Open ~/.tmux.conf and ~/.config/tmux/statusline.conf in a new window and balance splits
tmux send-keys -t configs:tmux-config.0 'vim ~/.config/tmux/tmux.conf' C-m
tmux send-keys -t configs:tmux-config.0 ':vsp ~/.config/tmux/statusline.conf' C-m
tmux send-keys -t configs:tmux-config.0 ':wincmd =' C-m

# Open ~/.config/nvim files in a new window and balance splits
tmux send-keys -t configs:nvim-config.0 'vim ~/.config/nvim/lua/base.lua' C-m
tmux send-keys -t configs:nvim-config.0 ':vsp ~/.config/nvim/lua/maps.lua' C-m
tmux send-keys -t configs:nvim-config.0 ':wincmd =' C-m
