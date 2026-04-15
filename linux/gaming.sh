#!/bin/bash

echo "Installing gaming components..."

# Platforms
yay -S --noconfirm steam heroic-games-launcher-bin lutris retroarch

# Utilities
yay -S --noconfirm gamemode lib32-gamemode mango-hud lib32-mangohud

yay --S --noconfirm wine-staging winetricks

# Drivers
yay -S --noconfirm nvidia-dkms nvidia-utils lib32-nvidia-utils

echo "Gaming setup complete!"
