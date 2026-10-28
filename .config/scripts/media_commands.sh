#!/bin/zsh
# Media controls for whatever is in macOS Now Playing. Volume uses the system
# output when the device allows it (USB audio interfaces often don't), then
# falls back to YouTube Music Desktop's own volume if it's running.

YTMD=http://localhost:9863/query
VOLUME_STEP=6

ytmd() {
  curl -sf -m 2 -d "{\"command\": \"$1\"}" -H "Content-Type: application/json" "$YTMD" >/dev/null
}

volume() {
  local current
  current=$(osascript -e 'output volume of (get volume settings)')
  if [[ "$current" == <-> ]]; then
    osascript -e "set volume output volume ($current $1 $VOLUME_STEP)"
  elif ! ytmd "player-volume-$2"; then
    tmux display-message "Volume: no control on this output device, and YTMD isn't running"
  fi
}

case $1 in
  play) nowplaying-cli play ;;
  pause) nowplaying-cli pause ;;
  toggle) nowplaying-cli togglePlayPause ;;
  next) nowplaying-cli next ;;
  previous) nowplaying-cli previous ;;
  volume-up) volume + up ;;
  volume-down) volume - down ;;
  *) echo "unknown command: $1"; exit 1 ;;
esac
