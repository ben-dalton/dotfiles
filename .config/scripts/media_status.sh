#!/bin/zsh
# Currently playing track from macOS Now Playing (whichever app or browser
# tab last started playing: YouTube Music in a browser, YTMD, Spotify, ...)

INFO=("${(@f)$(nowplaying-cli get title artist playbackRate 2>/dev/null)}")
SONG=$INFO[1]
ARTIST=$INFO[2]
RATE=$INFO[3]

if [[ -z "$SONG" || "$SONG" == 'null' ]]; then
  echo ""
  exit
fi

if [[ "$RATE" == 0 ]]; then
  ICON='॥'
else
  ICON='▷'
fi

if [[ -z "$ARTIST" || "$ARTIST" == 'null' ]]; then
  echo "$ICON $SONG"
else
  echo "$ICON $SONG by $ARTIST"
fi
