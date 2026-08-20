#!/bin/bash

if grep -q 'include cyberdream-transparent.conf' ~/.config/kitty/current-theme.conf; then
  sed -i '' 's/cyberdream-transparent/cyberdream/g' ~/.config/kitty/current-theme.conf
  echo "Done! Reload kitty config with ctrl+cmd+,"
elif grep -q 'include cyberdream.conf' ~/.config/kitty/current-theme.conf; then
  sed -i '' 's/cyberdream.conf/cyberdream-transparent.conf/g' ~/.config/kitty/current-theme.conf
  echo "Done! Reload kitty config with ctrl+cmd+,"
else
  echo "There's no background_opacity present in the current kitty theme..."
fi
