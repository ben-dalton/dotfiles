#!/bin/bash
# tmux status-bar weather. tmux reruns #() every status-interval (5s via
# tmux-sensible), so cache the result and only hit wttr.in every 15 minutes.
# No location in the URL: wttr.in uses the location of the current IP.

CACHE="${XDG_CACHE_HOME:-$HOME/.cache}/tmux-weather"
MAX_AGE=900

if [ -f "$CACHE" ] && [ $(( $(date +%s) - $(stat -f %m "$CACHE") )) -lt "$MAX_AGE" ]; then
  cat "$CACHE"
  exit 0
fi

mkdir -p "$(dirname "$CACHE")"
WEATHER="$(curl -sf -m 10 'wttr.in/?u&format=%c%20%t%20%w')"

# Keep the last good reading on failure; wttr.in can return error text
# (rate limits, unknown location) as a long or multi-line body
if [ -n "$WEATHER" ] && [ "${#WEATHER}" -lt 40 ] && [ "$(printf '%s' "$WEATHER" | wc -l)" -eq 0 ]; then
  printf '%s' "$WEATHER" > "$CACHE"
else
  touch "$CACHE"
fi

cat "$CACHE"
