#!/bin/bash

THEME_FILE=~/.config/kitty/current-theme.conf

# Untracked in dotfiles; kitty.conf defaults to the opaque theme when it's
# missing, so the first toggle switches to transparent
if [ ! -f "$THEME_FILE" ]; then
  echo "include cyberdream-transparent.conf" > "$THEME_FILE"
  echo "Done! Reload kitty config with ctrl+cmd+,"
elif grep -q 'include cyberdream-transparent.conf' "$THEME_FILE"; then
  sed -i '' 's/cyberdream-transparent/cyberdream/g' "$THEME_FILE"
  echo "Done! Reload kitty config with ctrl+cmd+,"
elif grep -q 'include cyberdream.conf' "$THEME_FILE"; then
  sed -i '' 's/cyberdream.conf/cyberdream-transparent.conf/g' "$THEME_FILE"
  echo "Done! Reload kitty config with ctrl+cmd+,"
else
  echo "There's no background_opacity present in the current kitty theme..."
fi
