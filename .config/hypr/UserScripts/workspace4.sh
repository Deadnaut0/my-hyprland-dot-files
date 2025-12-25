#!/bin/bash

# Kill any existing instances
killall -9 btop cava 2>/dev/null
pkill -f tty-clock 2>/dev/null

sleep 0.2

# Switch to workspace 4
hyprctl dispatch workspace 4

# Launch btop first
kitty --class btop-tiled -e btop &
sleep 0.4

# Toggle split to horizontal, then launch cava
hyprctl dispatch togglesplit
kitty --class cava-tiled -e cava &
sleep 0.8

# Now resize both btop and cava to take only % height (top half)
hyprctl dispatch focuswindow class:btop-tiled
hyprctl dispatch resizeactive exact 36% 36%

hyprctl dispatch focuswindow class:cava-tiled
hyprctl dispatch resizeactive exact 64% 64%

# Now there's space at the top left - toggle split back to vertical and spawn pipes
hyprctl dispatch focuswindow class:btop-tiled
hyprctl dispatch togglesplit
kitty --class effect-tiled -e tty-clock -cst &
sleep 0.5

# Force tile all
hyprctl dispatch settiled class:btop-tiled
hyprctl dispatch settiled class:effect-tiled
hyprctl dispatch settiled class:cava-tiled

# Resize cava to take full bottom half
# hyprctl dispatch focuswindow class:pipes-tiled
# hyprctl dispatch resizeactive exact 100% 50%

echo "Layout applied: btop (top-left), pipes.sh (top-right), cava (bottom)!"
