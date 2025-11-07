#!/bin/bash

echo "Running development tools installation..."

# Browser
yay -S --noconfirm vivaldi chromium

# Version Control
yay -S --noconfirm git github-cli 

# Editors
yay -S --noconfirm neovim visual-studio-code-bin

# Languages
yay -S --noconfirm python python-pip ruby rubygems ruby-bundler nodejs npm yarn

# Containers
yay -S --noconfirm docker docker-compose

# Databases
yay -S --noconfirm sqlite

# Utilities
yay -S --noconfirm postman-bin

# Terminal
yay -S --noconfirm zsh oh-my-zsh-git

echo "Development setup complete!"
