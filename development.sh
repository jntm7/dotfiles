#!/bin/bash
echo "Running development tools installation..."

# Browser
sudo pacman -S --noconfirm vivaldi firefox

# Version Control
sudo pacman -S --noconfirm git github-cli github-desktop

# Editors
sudo pacman -S --noconfirm neovim code
sudo yay -S --noconfirm visual-studio-code-bin

# Languages
sudo pacman -S --noconfirm python python-pip nodejs npm yarn

# Containers
sudo pacman -S --noconfirm docker docker-compose

# Databases
sudo pacman -S --noconfirm sqlite

# Terminal
sudo pacman -S --noconfirm zsh alacritty fzf zoxide zsh-syntax-highlighting zsh-autosuggestions
# oh-my-zsh
echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
echo "Installing powerlevel10k..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Fonts
sudo pacman -S --noconfirm ttf-meslo-nerd
sudo pacman -S --noconfirm ttf-jetbrains-mono-nerd

echo "Development setup complete!"
echo "Don't forget to chsh -s /usr/bin/zsh"
